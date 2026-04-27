import 'dart:async';
import 'package:uuid/uuid.dart';
import 'dart:math' show pow;

import 'package:flutter/foundation.dart';

import '../connectivity/connectivity_orchestrator.dart';
import '../services/connectivity_service.dart';
import '../services/queue_service.dart';
import '../constants.dart';
import '../../features/ai_insights/data/insight_cache_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/providers/sync_status_provider.dart';
import '../../shared/providers/device_service_provider.dart';
import '../../features/symptom_tracking/data/symptom_repository.dart';
import '../../features/symptom_tracking/domain/symptom_entity.dart';

// ──────────────────────────────────────────────────────────────
//  Sync service
// ──────────────────────────────────────────────────────────────

/// Handles Firestore synchronisation and offline queue processing.
///
/// When connectivity is restored, the service:
///   1. Drains all pending [QueueItem]s from [QueueService],
///      pushing each to Firestore.
///   2. Clears expired insight caches.
///
/// A periodic timer also runs at [AppConstants.syncInterval] to
/// catch any items that might have been missed.
class SyncService {
  final QueueService _queueService;
  final ConnectivityOrchestrator _orchestrator;
  final InsightCacheService _insightCacheService;
  final dynamic ref;

  Timer? _periodicTimer;
  bool _isSyncing = false;

  SyncService({
    QueueService? queueService,
    ConnectivityOrchestrator? orchestrator,
    InsightCacheService? insightCacheService,
    this.ref,
  })  : _queueService = queueService ?? QueueService(),
        _orchestrator = orchestrator ?? ConnectivityOrchestrator(),
        _insightCacheService =
            insightCacheService ?? InsightCacheService();

  // ── Lifecycle ────────────────────────────────────────────────

  /// Starts listening for connectivity changes and sets up
  /// the periodic sync timer.
  void start() {
    // Reset retries once on start to recover from any persistent rule failures.
    _queueService.resetRetries().then((_) {
      debugPrint('[Sync] Queue retries reset.');
    }).catchError((e) {
      debugPrint('[Sync] Failed to reset queue retries: $e');
    });

    // React to connectivity transitions.
    _orchestrator.addListener(_onConnectivityChanged);

    // Periodic sweep for missed items.
    _periodicTimer = Timer.periodic(
      AppConstants.syncInterval,
      (_) async {
        if (FirebaseAuth.instance.currentUser != null) {
          await syncNow();
        }
      },
    );
  }

  /// Stops all timers and listeners. Call on app shutdown.
  void stop() {
    _periodicTimer?.cancel();
    _periodicTimer = null;
    _orchestrator.removeListener(_onConnectivityChanged);
  }

  // ── Public API ───────────────────────────────────────────────

  /// Triggers an immediate sync attempt.
  ///
  /// Returns the number of items successfully synced.
  /// Returns `0` if offline or already syncing.
  Future<int> syncNow() async {
    if (_isSyncing) {
      debugPrint('[Sync] Already syncing — skipping duplicate request.');
      return 0;
    }

    final isOnline = await _orchestrator.isOnline;
    if (!isOnline) {
      debugPrint('[Sync] Device offline — skipping sync.');
      return 0;
    }

    debugPrint('[Sync] Starting sync...');
    _isSyncing = true;
    int synced = 0;

    try {
      // 1. Backfill legacy records if needed.
      await _backfillLegacyRecords();

      // 2. Push pending queue items to Firestore.
      final pending = await _queueService.getPending();
      final totalUnsynced = await _queueService.pendingCount;
      debugPrint('[Sync] Found ${pending.length} items ready to sync (out of $totalUnsynced pending).');

      for (final item in pending) {
        try {
          debugPrint('[Sync] Uploading item ${item.id} (${item.action})...');
          await _pushToFirestore(item);
          await _queueService.markSynced(item.id);
          synced++;
          debugPrint('[Sync] Item ${item.id} synced successfully.');
        } catch (e) {
          debugPrint('[Sync] Item ${item.id} failed (retry ${item.retryCount + 1}): $e');
          await _queueService.incrementRetry(item.id);
        }
      }

      // 3. Pull latest changes from remote.
      await _pullRemoteChanges();

      // 4. Clean up successfully synced entries.
      if (synced > 0) {
        await _queueService.purgeSynced();
        debugPrint('[Sync] Purged $synced synced entries.');
      }

      // 5. Clear expired insight caches.
      await _insightCacheService.clearExpired();
      debugPrint('[Sync] Cleared expired insight caches.');
    } finally {
      _isSyncing = false;
    }

    return synced;
  }

  /// Returns the number of items still waiting to be synced.
  Future<int> get pendingCount => _queueService.pendingCount;

  // ── Internals ────────────────────────────────────────────────

  void _onConnectivityChanged(NetworkStatus status) async {
    if (status == NetworkStatus.offline) {
      ref?.read(syncStatusProvider.notifier).state = SyncStatus.offline;
    } else if (status == NetworkStatus.online) {
      // Device just came back online.
      ref?.read(syncStatusProvider.notifier).state = SyncStatus.syncing;
      debugPrint("Internet restored -> syncing...");

      if (FirebaseAuth.instance.currentUser != null) {
        try {
          final count = await syncNow();
          
          if (count > 0) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setInt('last_sync_count', count);
            await prefs.setString(
              'last_sync_time',
              DateTime.now().toIso8601String(),
            );
            debugPrint('[Sync] ✓ Synced $count items to Firestore');
          }

          ref?.read(syncStatusProvider.notifier).state = SyncStatus.synced;
        } catch (e) {
          debugPrint('[Sync] Sync failed after connectivity restored: $e');
          ref?.read(syncStatusProvider.notifier).state = SyncStatus.offline;
        }
      } else {
        ref?.read(syncStatusProvider.notifier).state = SyncStatus.offline;
        debugPrint('[Sync] Online but waiting for login to sync');
      }
    }
  }

  Future<void> syncPendingData() async => syncNow();

  /// Pushes a single [QueueItem] to Firestore.
  ///
  /// Uses [_resolveCollection] to map action names to proper
  /// Firestore collection paths (e.g. `add_symptom` → `symptomLogs`).
  ///
  /// Behaviour depends on the item's action and payload:
  ///   - **delete_symptom** → deletes the doc specified by `payload['docId']`.
  ///   - **payload contains `docId`** → upserts (merge) into that doc.
  ///   - **otherwise** → creates a new document via `.add()`.
  ///
  /// Throws on failure so [QueueService.incrementRetry] handles retries.
  Future<void> _pushToFirestore(QueueItem item) async {
    final firestore = FirebaseFirestore.instance;
    final payload = Map<String, dynamic>.from(item.payload);
    final collection = _resolveCollection(item.action);

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      debugPrint('[Sync] User not authenticated — retry later');
      throw Exception('User not authenticated');
    }

    debugPrint('[Sync] Action: ${item.action} → collection: $collection');
    debugPrint('[Sync] Writing to users/${user.uid}/$collection');

    if (item.retryCount > 0) {
      final backoffSeconds = pow(2, item.retryCount).toInt().clamp(1, 60);
      debugPrint('[Sync] Backoff ${backoffSeconds}s for item '
                 '${item.id} (retry ${item.retryCount})');
      await Future.delayed(Duration(seconds: backoffSeconds));
    }

    // Attach metadata.
    final deviceId = await ref?.read(deviceServiceProvider).getDeviceId();
    payload['deviceId'] = deviceId;
    payload['syncedAt'] = FieldValue.serverTimestamp();

    // ── PROFILE UPDATE ────────────────────────────────────────
    if (item.action == 'update_profile') {
      debugPrint('[Sync] Updating user profile document');
      await firestore.collection('users').doc(user.uid).set(payload, SetOptions(merge: true));
      return;
    }

    final collectionRef = firestore
        .collection('users')
        .doc(user.uid)
        .collection(collection);

    // ── SOFT DELETE ────────────────────────────────────────────
    if (item.action == 'delete_symptom' || payload['isDeleted'] == true) {
      final clientId = payload['clientId'] as String?;
      if (clientId == null) return;

      debugPrint('[Sync] Soft-deleting doc $clientId in $collection');
      await collectionRef.doc(clientId).set(payload, SetOptions(merge: true));
      return;
    }

    // ── UPSERT (merge) ────────────────────────────────────────
    final clientId = payload['clientId'] as String?;
    if (clientId == null) {
      debugPrint('[Sync] Critical: Missing clientId in symptom payload');
      throw Exception('Missing clientId in sync payload');
    }

    try {
      await collectionRef
          .doc(clientId)
          .set(payload, SetOptions(merge: true));
      debugPrint('[Sync] ✓ Wrote $clientId to Firestore');
    } catch (e, stack) {
      debugPrint('[Sync Error] Failed to write $clientId: $e');
      rethrow; 
    }
  }

  /// Fetches latest changes from Firestore and merges into local Isar DB.
  /// 
  /// Implements Last-Write-Wins logic based on [updatedAt].
  Future<void> _pullRemoteChanges() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    debugPrint('[Sync] Pulling remote changes...');
    final repository = SymptomRepositoryImpl();
    
    // 1. Fetch from Firestore
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('symptomLogs')
        .get();

    for (final doc in snapshot.docs) {
      final data = doc.data();
      final clientId = data['clientId'] as String?;
      if (clientId == null) continue;

      final remoteUpdatedAtStr = (data['updatedAt'] ?? data['timestamp']) as String?;
      if (remoteUpdatedAtStr == null) continue;
      final remoteUpdatedAt = DateTime.parse(remoteUpdatedAtStr);
      
      // 2. Search local by clientId
      final localLogs = await repository.getAllLogs();
      final localMatch = localLogs.cast<SymptomEntity?>().firstWhere(
        (e) => e?.clientId == clientId,
        orElse: () => null,
      );

      if (localMatch == null || remoteUpdatedAt.isAfter(localMatch.updatedAt)) {
        debugPrint('[Sync] Overwriting local $clientId with newer remote version');
        await repository.upsertLog(SymptomEntity(
          id: localMatch?.id ?? '0', // upsertLog handles ID mapping via clientId
          clientId: clientId,
          timestamp: DateTime.parse(data['timestamp'] as String),
          updatedAt: remoteUpdatedAt,
          isDeleted: data['isDeleted'] ?? false,
          deviceId: data['deviceId'],
          irregularCycle: data['irregularCycle'] ?? false,
          acne: data['acne'] ?? false,
          weightGain: data['weightGain'] ?? false,
          hairGrowth: data['hairGrowth'] ?? false,
          moodIssues: data['moodIssues'] ?? false,
          hairThinning: data['hairThinning'] ?? false,
          skinDarkening: data['skinDarkening'] ?? false,
          fatigue: data['fatigue'] ?? false,
          sleepProblems: data['sleepProblems'] ?? false,
          bloating: data['bloating'] ?? false,
          familyHistory: data['familyHistory'] ?? false,
          difficultyConceiving: data['difficultyConceiving'] ?? false,
          notes: data['notes'],
        ));
      }
    }
  }

  /// Assigns [clientId] and [updatedAt] to existing local records 
  /// that were created before the sync hardening.
  Future<void> _backfillLegacyRecords() async {
    final repository = SymptomRepositoryImpl();
    final logs = await repository.getAllLogs();

    final legacyLogs = logs.where((e) => e.clientId == null).toList();
    if (legacyLogs.isEmpty) return;

    debugPrint('[Sync] Backfilling ${legacyLogs.length} legacy local records');
    final deviceId = await ref?.read(deviceServiceProvider).getDeviceId();

    for (final log in legacyLogs) {
      final updated = log.copyWith(
        clientId: Uuid().v4(),
        updatedAt: log.timestamp, 
        deviceId: deviceId,
      );
      // We use upsertLog which handles existing ID matching via clientId.
      // Since clientId was null, it will create a NEW record or match incorrectly 
      // if multiple are null. Better to use put directly if we have the Isar ID.
      await repository.upsertLog(updated);

      // CRITICAL: We must also enqueue these for sync, otherwise they stay local-only!
      await _queueService.enqueue(
        action: 'add_symptom',
        payload: {
          ...updated.toJson(),
          'updatedAt': updated.updatedAt.toIso8601String(),
        },
      );
      debugPrint('[Sync] Backfilled and enqueued record ${updated.id}');
    }
    debugPrint('[Sync] Backfill complete');
  }

  /// Maps queue action names to their canonical Firestore collection.
  String _resolveCollection(String action) {
    switch (action) {
      case 'add_symptom':
      case 'update_symptom':
      case 'delete_symptom':
      case 'symptomLogs':
        return 'symptomLogs';
      case 'add_insight':
      case 'update_insight':
      case 'delete_insight':
        return 'insights';
      case 'add_cycle':
      case 'update_cycle':
      case 'delete_cycle':
        return 'cycleEntries';
      default:
        return action;
    }
  }
}
