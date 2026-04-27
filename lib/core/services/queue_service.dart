import 'dart:convert';

import 'package:isar/isar.dart';

import '../isar/isar_service.dart';
import '../isar/schemas/sync_queue.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ──────────────────────────────────────────────────────────────
//  Queue item model (domain-level)
// ──────────────────────────────────────────────────────────────

/// A lightweight representation of a queued offline action.
class QueueItem {
  final int id;
  final String action;
  final Map<String, dynamic> payload;
  final DateTime createdAt;
  final int retryCount;
  final bool isSynced;

  const QueueItem({
    required this.id,
    required this.action,
    required this.payload,
    required this.createdAt,
    this.retryCount = 0,
    this.isSynced = false,
  });
}

// ──────────────────────────────────────────────────────────────
//  Queue service
// ──────────────────────────────────────────────────────────────

/// Manages the offline request queue backed by Isar's [SyncQueue].
///
/// Every mutation that must eventually reach Firestore is enqueued
/// here while the device is offline. [SyncService] drains the queue
/// when connectivity is restored.
class QueueService {
  final IsarService _isarService;

  QueueService({IsarService? isarService})
      : _isarService = isarService ?? IsarService();

  // ── Enqueue ──────────────────────────────────────────────────

  /// Adds a new action to the sync queue.
  ///
  /// [action]  – a short verb describing the operation (e.g. `'add_symptom'`).
  /// [payload] – serialisable data that will be sent to Firestore.
  Future<int> enqueue({
    required String action,
    required Map<String, dynamic> payload,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw QueueServiceException('Cannot enqueue action "$action" - user is not authenticated');
    }

    // ── VALIDATION ─────────────────────────────────────────────
    // Symptom-related actions MUST have clientId and updatedAt.
    if (action.contains('symptom')) {
      if (payload['clientId'] == null) {
        throw QueueServiceException('clientId is required for symptom sync items');
      }
      if (payload['updatedAt'] == null) {
        throw QueueServiceException('updatedAt is required for symptom sync items');
      }
    }

    try {
      final isar = await _isarService.db;
      final entry = SyncQueue()
        ..userId = user.uid
        ..action = action
        ..payload = jsonEncode(payload)
        ..createdAt = DateTime.now()
        ..retryCount = 0
        ..isSynced = false;

      late int id;
      await isar.writeTxn(() async {
        id = await isar.syncQueues.put(entry);
      });

      final length = await pendingCount;
      if (length > 100) {
        // ignore: avoid_print
        print('[Queue] Warning: $length pending items. User should login to sync.');
      }

      return id;
    } catch (e) {
      if (e is QueueServiceException) rethrow;
      throw QueueServiceException('Failed to enqueue action "$action": $e');
    }
  }

  // ── Read ─────────────────────────────────────────────────────

  /// Returns all pending (un-synced) items ordered by creation time.
  Future<List<QueueItem>> getPending() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    try {
      final isar = await _isarService.db;
      final entries = await isar.syncQueues
          .filter()
          .userIdEqualTo(user.uid)
          .and()
          .isSyncedEqualTo(false)
          .retryCountLessThan(AppConstants.maxQueueRetries)
          .sortByCreatedAt()
          .findAll();

      return entries.map(_toItem).toList();
    } catch (e) {
      throw QueueServiceException('Failed to fetch pending queue items: $e');
    }
  }

  /// Returns the total count of un-synced items.
  Future<int> get pendingCount async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return 0;

    try {
      final isar = await _isarService.db;
      return await isar.syncQueues
          .filter()
          .userIdEqualTo(user.uid)
          .and()
          .isSyncedEqualTo(false)
          .count();
    } catch (e) {
      throw QueueServiceException('Failed to count pending items: $e');
    }
  }

  Future<bool> hasPendingItems() async => (await pendingCount) > 0;

  // ── Update ───────────────────────────────────────────────────

  /// Marks an item as synced so it won't be retried.
  Future<void> markSynced(int id) async {
    try {
      final isar = await _isarService.db;

      await isar.writeTxn(() async {
        final entry = await isar.syncQueues.get(id);
        if (entry != null) {
          entry.isSynced = true;
          await isar.syncQueues.put(entry);
        }
      });
    } catch (e) {
      throw QueueServiceException('Failed to mark item $id as synced: $e');
    }
  }

  /// Increments the retry counter for a failed item.
  Future<void> incrementRetry(int id) async {
    try {
      final isar = await _isarService.db;

      await isar.writeTxn(() async {
        final entry = await isar.syncQueues.get(id);
        if (entry != null) {
          entry.retryCount += 1;
          await isar.syncQueues.put(entry);
        }
      });
    } catch (e) {
      throw QueueServiceException(
          'Failed to increment retry for item $id: $e');
    }
  }

  /// Resets the retry counter for all unsynced items.
  /// 
  /// Useful after fixing a persistent configuration error (like Firestore rules).
  Future<void> resetRetries() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        final pending = await isar.syncQueues
            .filter()
            .userIdEqualTo(user.uid)
            .and()
            .isSyncedEqualTo(false)
            .findAll();
        
        for (final entry in pending) {
          entry.retryCount = 0;
          await isar.syncQueues.put(entry);
        }
      });
    } catch (e) {
      throw QueueServiceException('Failed to reset retries: $e');
    }
  }

  // ── Delete ───────────────────────────────────────────────────

  /// Removes all items that have been successfully synced.
  Future<void> purgeSynced() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final isar = await _isarService.db;

      await isar.writeTxn(() async {
        final synced = await isar.syncQueues
            .filter()
            .userIdEqualTo(user.uid)
            .and()
            .isSyncedEqualTo(true)
            .findAll();
        final ids = synced.map((e) => e.id).toList();
        await isar.syncQueues.deleteAll(ids);
      });
    } catch (e) {
      throw QueueServiceException('Failed to purge synced items: $e');
    }
  }

  /// Clears the entire queue. Useful for account logout / testing.
  Future<void> clearAll() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        await isar.syncQueues
            .filter()
            .userIdEqualTo(user.uid)
            .deleteAll();
      });
    } catch (e) {
      throw QueueServiceException('Failed to clear queue: $e');
    }
  }

  // ── Mapper ───────────────────────────────────────────────────

  QueueItem _toItem(SyncQueue entry) {
    return QueueItem(
      id: entry.id,
      action: entry.action,
      payload: jsonDecode(entry.payload) as Map<String, dynamic>,
      createdAt: entry.createdAt,
      retryCount: entry.retryCount,
      isSynced: entry.isSynced,
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  Custom exception
// ──────────────────────────────────────────────────────────────

/// Thrown when a [QueueService] operation fails.
class QueueServiceException implements Exception {
  final String message;
  const QueueServiceException(this.message);

  @override
  String toString() => 'QueueServiceException: $message';
}
