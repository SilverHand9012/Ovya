import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/symptom_repository.dart';
import '../domain/symptom_entity.dart';
import '../../../core/intelligence/detection_engine.dart';
import '../../../core/services/queue_service.dart';
import '../../../shared/providers/sync_service_provider.dart';
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
      final symptoms = await _repository.getAllLogs();
      debugPrint('[Symptom] Loaded ${symptoms.length} logs.');
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
      // 1. Save to local Isar DB.
      debugPrint('[Symptom] Saving new symptom log...');
      await _repository.addSymptomLog(symptom);
      debugPrint('[Symptom] Saved to local DB.');

      // 2. Enqueue for offline sync.
      await _queueService.enqueue(
        action: 'add_symptom',
        payload: {
          'timestamp': symptom.timestamp.toIso8601String(),
          'irregularCycle': symptom.irregularCycle,
          'acne': symptom.acne,
          'weightGain': symptom.weightGain,
          'hairGrowth': symptom.hairGrowth,
          'moodIssues': symptom.moodIssues,
          'hairThinning': symptom.hairThinning,
          'skinDarkening': symptom.skinDarkening,
          'fatigue': symptom.fatigue,
          'sleepProblems': symptom.sleepProblems,
          'bloating': symptom.bloating,
          'familyHistory': symptom.familyHistory,
          'difficultyConceiving': symptom.difficultyConceiving,
          'notes': symptom.notes ?? '',
        },
      );
      
      debugPrint('[Queue] Added symptom to queue');

      // 3. Trigger realtime sync attempt quietly in the background without blocking the UI
      try {
        final syncService = ref.read(syncServiceProvider);
        Future.microtask(() async {
          try {
            await syncService.syncPendingData();
            await syncService.syncNow();
          } catch (_) {}
        });
      } catch (_) {}

      // 4. Run risk evaluation.
      debugPrint('[Symptom] Running detection engine...');
      final riskResult = _detectionEngine.evaluate(symptom);
      debugPrint('[Symptom] Risk: ${riskResult.level} (score: ${riskResult.score})');

      // 5. Refresh symptom list from DB and update state.
      final updatedSymptoms = await _repository.getAllLogs();

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

  // ── Delete symptom ───────────────────────────────────────────

  /// Deletes a single symptom log by its [id].
  Future<void> deleteSymptom(String id) async {
    try {
      await _repository.deleteLog(id);

      // Refresh list.
      final updatedSymptoms = await _repository.getAllLogs();
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
