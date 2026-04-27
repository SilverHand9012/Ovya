import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'schemas/symptom_log.dart';
import 'schemas/cycle_entry.dart';
import 'schemas/insight_cache.dart';
import 'schemas/sync_queue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages the Isar database instance and lifecycle.
///
/// Uses a lazy singleton pattern — the database is opened once on
/// the first call to [db] and reused for the app's lifetime.
class IsarService {
  static IsarService? _instance;
  Isar? _isar;

  IsarService._();

  /// Returns the singleton [IsarService] instance.
  factory IsarService() {
    _instance ??= IsarService._();
    return _instance!;
  }

  /// Returns the opened [Isar] database instance.
  ///
  /// Opens the database on the first invocation, registering all
  /// collection schemas. Subsequent calls return the cached instance.
  Future<Isar> get db async {
    if (_isar != null && _isar!.isOpen) {
      return _isar!;
    }

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        SymptomLogSchema,
        CycleEntrySchema,
        InsightCacheSchema,
        SyncQueueSchema,
      ],
      directory: dir.path,
      name: 'ovya',
    );

    return _isar!;
  }

  /// Closes the database. Primarily used in testing or graceful shutdown.
  Future<void> close() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }

  // ── Sync Integration ──────────────────────────────────────────

  Future<String> _getCurrentUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) return user.uid;
    
    final prefs = await SharedPreferences.getInstance();
    const guestIdKey = 'guest_user_id';
    String? guestId = prefs.getString(guestIdKey);
    if (guestId == null) {
      guestId = 'guest_${DateTime.now().millisecondsSinceEpoch}';
      await prefs.setString(guestIdKey, guestId);
    }
    return guestId;
  }

  Future<List<SymptomLog>> getUnsyncedLogs() async {
    final currentUserId = await _getCurrentUserId();
    
    final isar = await db;
    return isar.symptomLogs
        .filter()
        .userIdEqualTo(currentUserId)
        .and()
        .syncedEqualTo(false)
        .findAll();
  }

  Future<void> markAsSynced(int id) async {
    final isar = await db;
    final log = await isar.symptomLogs.get(id);
    if (log != null) {
      log.synced = true;
      await isar.writeTxn(() async {
        await isar.symptomLogs.put(log);
      });
    }
  }

  /// Wipes all data locally. Call exclusively on User Logout.
  Future<void> clearAll() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
