import 'dart:async';

import 'package:flutter/foundation.dart';

import '../connectivity/connectivity_orchestrator.dart';
import '../services/connectivity_service.dart';
import '../services/queue_service.dart';
import '../constants.dart';
import '../../features/ai_insights/data/insight_cache_service.dart';
import '../isar/isar_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/providers/sync_status_provider.dart';

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
  final ProviderContainer? ref;

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
    // React to connectivity transitions.
    _orchestrator.addListener(_onConnectivityChanged);

    // Periodic sweep for missed items.
    _periodicTimer = Timer.periodic(
      AppConstants.syncInterval,
      (_) => syncNow(),
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
      // 1. Push pending queue items to Firestore.
      final pending = await _queueService.getPending();
      debugPrint('[Sync] Found ${pending.length} pending items.');

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

      // 2. Clean up successfully synced entries.
      if (synced > 0) {
        await _queueService.purgeSynced();
        debugPrint('[Sync] Purged $synced synced entries.');
      }

      // 3. Clear expired insight caches.
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
      await syncPendingData();
      ref?.read(syncStatusProvider.notifier).state = SyncStatus.synced;
      
      // Keep existing queue sync functionality as well
      syncNow();
    }
  }

  Future<void> syncPendingData() async {
    final isarService = IsarService();
    final firestore = FirebaseFirestore.instance;
    
    final unsyncedLogs = await isarService.getUnsyncedLogs();
    debugPrint("Unsynced logs: ${unsyncedLogs.length}");

    if (unsyncedLogs.isNotEmpty) {
      debugPrint("Sync started");
    }

    for (final log in unsyncedLogs) {
      try {
        debugPrint("Uploading log: ${log.id}");
        await firestore
            .collection('users')
            .doc('demo_user')
            .collection('symptomLogs')
            .add(log.toJson());
        await isarService.markAsSynced(log.id);
      } catch(e) {
        debugPrint('[Sync] Error syncing log ${log.id}: $e');
      }
    }

    if (unsyncedLogs.isNotEmpty) {
      debugPrint("Sync completed");
    }
  }

  /// Pushes a single [QueueItem] to Firestore.
  ///
  /// TODO: Replace with actual Firestore write logic once
  /// Firebase is configured in the project.
  Future<void> _pushToFirestore(QueueItem item) async {
    // Placeholder — this is where the Firestore write call goes.
    // Example:
    // final collection = FirebaseFirestore.instance.collection(item.action);
    // await collection.add(item.payload);
    await Future<void>.delayed(const Duration(milliseconds: 50));
  }
}
