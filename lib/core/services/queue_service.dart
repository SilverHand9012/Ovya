import 'dart:convert';

import 'package:isar/isar.dart';

import '../isar/isar_service.dart';
import '../isar/schemas/sync_queue.dart';
import '../constants.dart';

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
    try {
      final isar = await _isarService.db;
      final entry = SyncQueue()
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
      throw QueueServiceException('Failed to enqueue action "$action": $e');
    }
  }

  // ── Read ─────────────────────────────────────────────────────

  /// Returns all pending (un-synced) items ordered by creation time.
  Future<List<QueueItem>> getPending() async {
    try {
      final isar = await _isarService.db;
      final entries = await isar.syncQueues
          .filter()
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
    try {
      final isar = await _isarService.db;
      return await isar.syncQueues
          .filter()
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

  // ── Delete ───────────────────────────────────────────────────

  /// Removes all items that have been successfully synced.
  Future<void> purgeSynced() async {
    try {
      final isar = await _isarService.db;

      await isar.writeTxn(() async {
        final synced = await isar.syncQueues
            .filter()
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
    try {
      final isar = await _isarService.db;
      await isar.writeTxn(() async {
        await isar.syncQueues.clear();
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
