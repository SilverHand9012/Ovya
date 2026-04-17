import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/insight_repository.dart';
import 'insights_state.dart';

// ──────────────────────────────────────────────────────────────
//  Insights notifier
// ──────────────────────────────────────────────────────────────

/// Manages AI insights state by coordinating with the
/// [InsightRepository] for online/offline insight generation
/// and cache management.
class InsightsNotifier extends StateNotifier<InsightsState> {
  final InsightRepository _repository;

  InsightsNotifier({InsightRepository? repository})
      : _repository = repository ?? InsightRepositoryImpl(),
        super(const InsightsState());

  // ── Load cached insights ─────────────────────────────────────

  /// Fetches all locally cached insights from Isar.
  Future<void> loadInsights() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final insights = await _repository.getInsights();

      // Show the latest cached insight text if available.
      final latestText =
          insights.isNotEmpty ? insights.first.insightText : null;
      final isFromCache = insights.isNotEmpty;

      state = state.copyWith(
        isLoading: false,
        insights: insights,
        latestInsight: latestText,
        isFromCache: isFromCache,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to load insights: $e',
      );
    }
  }

  // ── Generate new insight ─────────────────────────────────────

  /// Generates a fresh insight — uses Gemini AI when online,
  /// falls back to cached/offline content otherwise.
  Future<void> generateNewInsight() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final insightText = await _repository.generateInsight();

      // Refresh the full cache list.
      final insights = await _repository.getInsights();

      state = state.copyWith(
        isLoading: false,
        insights: insights,
        latestInsight: insightText,
        isFromCache: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Failed to generate insight: $e',
      );
    }
  }

  // ── Clear cache ──────────────────────────────────────────────

  /// Clears all cached insights.
  Future<void> clearCache() async {
    try {
      await _repository.clearCache();
      state = const InsightsState(); // Reset to initial state.
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Failed to clear cache: $e',
      );
    }
  }
}

// ──────────────────────────────────────────────────────────────
//  Provider
// ──────────────────────────────────────────────────────────────

/// Provider for the insights notifier.
final insightsNotifierProvider =
    StateNotifierProvider<InsightsNotifier, InsightsState>(
  (ref) => InsightsNotifier(),
);
