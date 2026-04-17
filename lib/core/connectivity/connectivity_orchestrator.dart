import 'dart:async';

import 'package:flutter/foundation.dart';

import '../services/connectivity_service.dart';
import '../intelligence/detection_engine.dart';
import '../ai/gemini_service.dart';
import '../../features/symptom_tracking/domain/symptom_entity.dart';

// ──────────────────────────────────────────────────────────────
//  Connectivity orchestrator
// ──────────────────────────────────────────────────────────────

/// Routes application logic between online and offline execution
/// paths based on the current [NetworkStatus].
///
/// Usage:
/// ```dart
/// final result = await orchestrator.execute(
///   online:  () => remoteDataSource.fetchSymptoms(),
///   offline: () => localDataSource.getCachedSymptoms(),
/// );
/// ```
///
/// Also provides PCOS-specific convenience methods:
/// - [runDetection] — always runs locally via [DetectionEngine].
/// - [fetchInsights] — uses Gemini when online, falls back to cache.
class ConnectivityOrchestrator {
  final ConnectivityService _connectivityService;
  final DetectionEngine _detectionEngine;
  final GeminiService _geminiService;
  StreamSubscription<NetworkStatus>? _subscription;

  /// Callbacks invoked when connectivity changes.
  final List<void Function(NetworkStatus)> _listeners = [];

  ConnectivityOrchestrator({
    ConnectivityService? connectivityService,
    DetectionEngine? detectionEngine,
    GeminiService? geminiService,
  })  : _connectivityService =
            connectivityService ?? ConnectivityService(),
        _detectionEngine = detectionEngine ?? DetectionEngine(),
        _geminiService = geminiService ?? GeminiService() {
    _subscription = _connectivityService.status.listen(_notifyListeners);
  }

  // ── Core API ─────────────────────────────────────────────────

  /// Executes [online] or [offline] depending on connectivity.
  ///
  /// Both callbacks must return the same type [T] so the caller
  /// gets a consistent result regardless of network state.
  Future<T> execute<T>({
    required Future<T> Function() online,
    required Future<T> Function() offline,
  }) async {
    final isConnected = await _connectivityService.isOnline;
    return isConnected ? online() : offline();
  }

  /// Runs [action] only when the device is online.
  /// Returns `null` if the device is currently offline.
  Future<T?> onlineOnly<T>(Future<T> Function() action) async {
    final isConnected = await _connectivityService.isOnline;
    return isConnected ? action() : null;
  }

  // ── PCOS-specific helpers ────────────────────────────────────

  /// Runs the [DetectionEngine] on the given [symptom].
  ///
  /// This is always a local operation — it works offline and
  /// online without any network dependency.
  RiskResult runDetection(SymptomEntity symptom) {
    return _detectionEngine.evaluate(symptom);
  }

  /// Fetches AI-generated insights for the given [symptom] and
  /// [riskLevel].
  ///
  /// - **Online**: calls [GeminiService] for fresh AI insights.
  /// - **Offline / API failure**: returns [cachedInsight] if
  ///   provided, otherwise a friendly fallback message.
  Future<String> fetchInsights({
    required SymptomEntity symptom,
    required String riskLevel,
    String? cachedInsight,
    String languageCode = 'en',
  }) async {
    final isConnected = await _connectivityService.isOnline;
    debugPrint('[Orchestrator] Fetching insights — online: $isConnected, lang: $languageCode');

    if (isConnected) {
      try {
        final aiInsight = await _geminiService.generateInsights(
          symptom: symptom,
          riskLevel: riskLevel,
          languageCode: languageCode,
        );
        debugPrint('[Orchestrator] AI insight fetched successfully.');
        return aiInsight;
      } catch (e) {
        // API failed — fall through to cached/fallback.
        debugPrint('[Orchestrator] AI fetch failed: $e — falling back to cache.');
      }
    }

    // Offline or API failed: use cached insight if available.
    if (cachedInsight != null && cachedInsight.isNotEmpty) {
      debugPrint('[Orchestrator] Returning cached insight.');
      return cachedInsight;
    }

    debugPrint('[Orchestrator] No cache available — returning offline message.');
    return 'You are currently offline. '
        'Your PCOS risk level is $riskLevel. '
        'Please connect to the internet for personalised AI insights.';
  }

  // ── Status helpers ───────────────────────────────────────────

  /// Returns the current [NetworkStatus] snapshot.
  Future<NetworkStatus> get currentStatus =>
      _connectivityService.currentStatus;

  /// Shorthand for checking online state.
  Future<bool> get isOnline => _connectivityService.isOnline;

  // ── Listener management ──────────────────────────────────────

  /// Registers a callback that fires whenever connectivity changes.
  void addListener(void Function(NetworkStatus) listener) {
    _listeners.add(listener);
  }

  /// Removes a previously registered listener.
  void removeListener(void Function(NetworkStatus) listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners(NetworkStatus status) {
    for (final listener in _listeners) {
      listener(status);
    }
  }

  // ── Cleanup ──────────────────────────────────────────────────

  /// Tears down internal subscriptions. Call on app shutdown.
  void dispose() {
    _subscription?.cancel();
    _listeners.clear();
    _connectivityService.dispose();
  }
}
