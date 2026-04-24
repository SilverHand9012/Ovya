import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uuid/uuid.dart';

import '../data/symptom_repository.dart';
import '../domain/symptom_entity.dart';
import '../../../core/intelligence/detection_engine.dart';
import '../../../core/services/queue_service.dart';
import '../../../shared/providers/sync_service_provider.dart';
import '../../../shared/providers/device_service_provider.dart';
import 'symptom_state.dart';

// ──────────────────────────────────────────────────────────────
//  Symptom notifier
// ──────────────────────────────────────────────────────────────

/// Manages symptom tracking state and connects the logging flow
/// with the [DetectionEngine] for offline risk evaluation.
///
/// Flow on new symptom log:
///   1. Save via [SymptomRepository]
///   2. Enqueue for sync via [QueueService]
///   3. Run [DetectionEngine.evaluate()]
///   4. Update state with latest risk result
class SymptomNotifier extends StateNotifier<SymptomState> {
  final SymptomRepository _repository;
  final DetectionEngine _detectionEngine;
  final QueueService _queueService;
  final Ref ref;

  SymptomNotifier({
    required this.ref,
    SymptomRepository? repository,
    DetectionEngine? detectionEngine,
    QueueService? queueService,
  })  : _repository = repository ?? SymptomRepositoryImpl(),
        _detectionEngine = detectionEngine ?? DetectionEngine(),
        _queueService = queueService ?? QueueService(),
        super(const SymptomState()) {
    // Auto-load exclusively on first instantiation
    loadSymptoms();
  }

  // ── Load all logs ────────────────────────────────────────────

  /// Fetches all symptom logs from the local database and
  /// evaluates the latest entry for risk scoring.
  Future<void> loadSymptoms() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      debugPrint('[Symptom] Loading all symptom logs...');
      final allLogs = await _repository.getAllLogs();
      final symptoms = allLogs.where((e) => !e.isDeleted).toList();
      debugPrint('[Symptom] Loaded ${symptoms.length} logs (filtered from ${allLogs.length}).');
      state = state.copyWith(
        isLoading: false,
        symptoms: symptoms,
      );

      // Auto-evaluate the latest log if one exists.
      if (symptoms.isNotEmpty) {
        evaluateLatest();
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load symptoms: $e',
      );
    }
  }

  // ── Add symptom ──────────────────────────────────────────────

  /// Persists a new symptom log locally, enqueues it for
  /// Firestore sync, and runs the detection engine.
  Future<void> addSymptom(SymptomEntity symptom) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      // 1. Enrich with sync identifiers.
      final clientId = Uuid().v4();
      final deviceId = await ref.read(deviceServiceProvider).getDeviceId();
      final updatedAt = DateTime.now();

      final enrichedSymptom = symptom.copyWith(
        clientId: clientId,
        deviceId: deviceId,
        updatedAt: updatedAt,
      );

      // 2. Save to local Isar DB.
      debugPrint('[Symptom] Saving new symptom log (clientId: $clientId)...');
      await _repository.addSymptomLog(enrichedSymptom);

      // 3. Enqueue for offline sync.
      await _queueService.enqueue(
        action: 'add_symptom',
        payload: {
          ...enrichedSymptom.toJson(),
          'updatedAt': updatedAt.toIso8601String(),
        },
      );
      
      debugPrint('[Symptom] Successfully enqueued for sync (clientId: $clientId)');

      // 4. Trigger realtime sync.
      _triggerSync();

      // 5. Run risk evaluation.
      final riskResult = _detectionEngine.evaluate(enrichedSymptom);

      // 6. Refresh list (excluding soft-deleted).
      final allLogs = await _repository.getAllLogs();
      final updatedSymptoms = allLogs.where((e) => !e.isDeleted).toList();

      state = state.copyWith(
        isLoading: false,
        symptoms: updatedSymptoms,
        riskResult: riskResult,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to add symptom: $e',
      );
    }
  }

  /// Updates an existing symptom log locally and enqueues for sync.
  Future<void> updateSymptom(SymptomEntity symptom) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final updatedAt = DateTime.now();
      final updatedSymptom = symptom.copyWith(updatedAt: updatedAt);

      await _repository.upsertLog(updatedSymptom);

      await _queueService.enqueue(
        action: 'update_symptom',
        payload: {
          ...updatedSymptom.toJson(),
          'updatedAt': updatedAt.toIso8601String(),
        },
      );

      _triggerSync();

      final allLogs = await _repository.getAllLogs();
      final updatedSymptoms = allLogs.where((e) => !e.isDeleted).toList();
      state = state.copyWith(
        isLoading: false,
        symptoms: updatedSymptoms,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to update symptom: $e',
      );
    }
  }

  // ── Delete symptom ───────────────────────────────────────────

  /// Deletes a single symptom log by its [id].
  /// 
  /// Performs a soft-delete locally and enqueues a `delete_symptom`
  /// action for Firestore.
  Future<void> deleteSymptom(String id) async {
    try {
      // Find item first to get clientId
      final symptom = state.symptoms.firstWhere((s) => s.id == id);
      
      await _repository.deleteLog(id);

      // Enqueue soft-delete for remote
      await _queueService.enqueue(
        action: 'delete_symptom',
        payload: {
          'clientId': symptom.clientId,
          'docId': symptom.clientId, // SyncService uses docId for deletes
          'isDeleted': true,
          'updatedAt': DateTime.now().toIso8601String(),
        },
      );

      _triggerSync();

      // Refresh list (excluding soft-deleted).
      final allLogs = await _repository.getAllLogs();
      final updatedSymptoms = allLogs.where((e) => !e.isDeleted).toList();
      state = state.copyWith(symptoms: updatedSymptoms);

      // Re-evaluate if logs remain, clear risk result if empty.
      if (updatedSymptoms.isNotEmpty) {
        evaluateLatest();
      } else {
        state = state.copyWith(clearRisk: true);
      }
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to delete symptom: $e',
      );
    }
  }

  void _triggerSync() {
    try {
      final syncService = ref.read(syncServiceProvider);
      Future.microtask(() async {
        try {
          await syncService.syncPendingData();
          await syncService.syncNow();
        } catch (_) {}
      });
    } catch (_) {}
  }

  // ── Evaluate latest ──────────────────────────────────────────

  /// Runs the [DetectionEngine] on the most recent symptom log
  /// and updates the state with the [RiskResult].
  void evaluateLatest() {
    if (state.symptoms.isEmpty) return;

    final latest = state.symptoms.first; // Already sorted newest-first.
    final result = _detectionEngine.evaluate(latest);
    state = state.copyWith(riskResult: result);
  }
}

// ──────────────────────────────────────────────────────────────
//  Provider
// ──────────────────────────────────────────────────────────────

/// Provider for the symptom notifier.
final symptomNotifierProvider =
    StateNotifierProvider<SymptomNotifier, SymptomState>(
  (ref) => SymptomNotifier(ref: ref),
);
