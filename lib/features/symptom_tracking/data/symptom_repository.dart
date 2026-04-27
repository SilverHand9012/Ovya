import 'package:isar/isar.dart';

import '../../../core/isar/isar_service.dart';
import '../../../core/isar/schemas/symptom_log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../domain/symptom_entity.dart';

// ──────────────────────────────────────────────────────────────
//  Abstract contract
// ──────────────────────────────────────────────────────────────

/// Defines the operations the symptom data layer must support.
///
/// Depends only on the domain [SymptomEntity] — no Isar types leak out.
abstract class SymptomRepository {
  /// Persists a new symptom log entry and returns its assigned ID.
  Future<int> addSymptomLog(SymptomEntity symptom);

  /// Returns every symptom log, newest first.
  Future<List<SymptomEntity>> getAllLogs();

  /// Returns the single most-recent log, or `null` if empty.
  Future<SymptomEntity?> getLatestLog();

  /// Returns a reactive stream of all logs (newest first).
  ///
  /// Emits a new list whenever the underlying Isar collection changes,
  /// making it ideal for use with Riverpod's `StreamProvider`.
  Stream<List<SymptomEntity>> watchAllLogs();

  /// Deletes a single log by its [id]. Returns `true` if the entry existed.
  /// 
  /// Per sync engine hardening, this performs a soft-delete (setting `isDeleted = true`).
  Future<bool> deleteLog(String id);

  /// Force-persists a remote log into the local database.
  /// 
  /// Used by [SyncService] pull logic for Last-Write-Wins resolution.
  Future<void> upsertLog(SymptomEntity symptom);

  /// Deletes every symptom log. Useful for account reset / testing.
  Future<void> deleteAllLogs();
}

// ──────────────────────────────────────────────────────────────
//  Concrete Isar implementation
// ──────────────────────────────────────────────────────────────

/// Isar-backed implementation of [SymptomRepository].
///
/// Handles all mapping between [SymptomEntity] (domain) and
/// [SymptomLog] (Isar schema) so the rest of the app never
/// touches database-specific types.
class SymptomRepositoryImpl implements SymptomRepository {
  final IsarService _isarService;

  SymptomRepositoryImpl({IsarService? isarService})
      : _isarService = isarService ?? IsarService();

  // ── Write ────────────────────────────────────────────────────

  @override
  Future<int> addSymptomLog(SymptomEntity symptom) async {
    try {
      final isar = await _isarService.db;
      final log = _toSchema(symptom);
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw SymptomRepositoryException('User not authenticated');
      log.userId = user.uid;

      late int id;
      await isar.writeTxn(() async {
        id = await isar.symptomLogs.put(log);
      });

      return id;
    } catch (e) {
      throw SymptomRepositoryException('Failed to add symptom log: $e');
    }
  }

  // ── Read ─────────────────────────────────────────────────────

  @override
  Future<List<SymptomEntity>> getAllLogs() async {
    try {
      final isar = await _isarService.db;

          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return [];
          
      final logs = await isar.symptomLogs
          .filter()
          .userIdEqualTo(user.uid)
          .sortByTimestampDesc()
          .findAll();

      return logs.map(_toEntity).toList();
    } catch (e) {
      throw SymptomRepositoryException('Failed to fetch symptom logs: $e');
    }
  }

  @override
  Future<SymptomEntity?> getLatestLog() async {
    try {
      final isar = await _isarService.db;

          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return null;
          
      final log = await isar.symptomLogs
          .filter()
          .userIdEqualTo(user.uid)
          .sortByTimestampDesc()
          .findFirst();

      return log != null ? _toEntity(log) : null;
    } catch (e) {
      throw SymptomRepositoryException('Failed to fetch latest log: $e');
    }
  }

  @override
  Stream<List<SymptomEntity>> watchAllLogs() async* {
    try {
      final isar = await _isarService.db;

      // Isar emits the full query result set every time the collection
      // is mutated, so downstream consumers always get a complete list.
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) return;
          
      yield* isar.symptomLogs
          .filter()
          .userIdEqualTo(user.uid)
          .sortByTimestampDesc()
          .watch(fireImmediately: true)
          .map((logs) => logs.map(_toEntity).toList());
    } catch (e) {
      throw SymptomRepositoryException(
          'Failed to watch symptom logs: $e');
    }
  }

  // ── Delete ───────────────────────────────────────────────────

  @override
  Future<bool> deleteLog(String id) async {
    try {
      final isar = await _isarService.db;
      final isarId = int.tryParse(id);

      if (isarId == null) {
        throw SymptomRepositoryException(
            'Invalid log ID "$id" — expected an integer.');
      }

      late bool deleted;
      await isar.writeTxn(() async {
        final existing = await isar.symptomLogs.get(isarId);
        if (existing != null) {
          existing.isDeleted = true;
          existing.updatedAt = DateTime.now();
          existing.synced = false;
          await isar.symptomLogs.put(existing);
          deleted = true;
        } else {
          deleted = false;
        }
      });

      return deleted;
    } catch (e) {
      if (e is SymptomRepositoryException) rethrow;
      throw SymptomRepositoryException('Failed to soft-delete symptom log: $e');
    }
  }

  @override
  Future<void> upsertLog(SymptomEntity symptom) async {
    try {
      final isar = await _isarService.db;
      final log = _toSchema(symptom);
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw SymptomRepositoryException('User not authenticated');
      log.userId = user.uid;

      // Try to find existing by clientId first
      SymptomLog? existingByClient;
      if (symptom.clientId != null) {
            final user = FirebaseAuth.instance.currentUser;
            if (user == null) throw SymptomRepositoryException('User not authenticated');
            
        existingByClient = await isar.symptomLogs
            .filter()
            .userIdEqualTo(user.uid)
            .and()
            .clientIdEqualTo(symptom.clientId)
            .findFirst();
      }
      
      if (existingByClient != null) {
        log.id = existingByClient.id;
      }

      await isar.writeTxn(() async {
        await isar.symptomLogs.put(log);
      });
    } catch (e) {
      throw SymptomRepositoryException('Failed to upsert symptom log: $e');
    }
  }

  @override
  Future<void> deleteAllLogs() async {
    try {
      final isar = await _isarService.db;

      await isar.writeTxn(() async {
            final user = FirebaseAuth.instance.currentUser;
            if (user == null) throw SymptomRepositoryException('User not authenticated');
            
        await isar.symptomLogs
            .filter()
            .userIdEqualTo(user.uid)
            .deleteAll();
      });
    } catch (e) {
      throw SymptomRepositoryException(
          'Failed to delete all symptom logs: $e');
    }
  }

  // ── Mappers ──────────────────────────────────────────────────

  /// Maps a domain [SymptomEntity] → Isar [SymptomLog].
  SymptomLog _toSchema(SymptomEntity entity) {
    return SymptomLog()
      ..clientId = entity.clientId
      ..timestamp = entity.timestamp
      ..updatedAt = entity.updatedAt
      ..isDeleted = entity.isDeleted
      ..deviceId = entity.deviceId
      ..irregularCycle = entity.irregularCycle
      ..acne = entity.acne
      ..weightGain = entity.weightGain
      ..hairGrowth = entity.hairGrowth
      ..moodIssues = entity.moodIssues
      ..hairThinning = entity.hairThinning
      ..skinDarkening = entity.skinDarkening
      ..fatigue = entity.fatigue
      ..sleepProblems = entity.sleepProblems
      ..bloating = entity.bloating
      ..familyHistory = entity.familyHistory
      ..difficultyConceiving = entity.difficultyConceiving
      ..notes = entity.notes
      ..synced = false;
  }

  /// Maps an Isar [SymptomLog] → domain [SymptomEntity].
  SymptomEntity _toEntity(SymptomLog log) {
    return SymptomEntity(
      id: log.id.toString(),
      clientId: log.clientId,
      timestamp: log.timestamp,
      updatedAt: log.updatedAt,
      isDeleted: log.isDeleted,
      deviceId: log.deviceId,
      irregularCycle: log.irregularCycle,
      acne: log.acne,
      weightGain: log.weightGain,
      hairGrowth: log.hairGrowth,
      moodIssues: log.moodIssues,
      hairThinning: log.hairThinning,
      skinDarkening: log.skinDarkening,
      fatigue: log.fatigue,
      sleepProblems: log.sleepProblems,
      bloating: log.bloating,
      familyHistory: log.familyHistory,
      difficultyConceiving: log.difficultyConceiving,
      notes: log.notes,
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  Custom exception
// ──────────────────────────────────────────────────────────────

/// Thrown when a [SymptomRepository] operation fails.
class SymptomRepositoryException implements Exception {
  final String message;
  const SymptomRepositoryException(this.message);

  @override
  String toString() => 'SymptomRepositoryException: $message';
}
