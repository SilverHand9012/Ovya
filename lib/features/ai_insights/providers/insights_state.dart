import '../../../core/isar/schemas/insight_cache.dart';

/// Immutable state class for AI insights.
///
/// Holds the current list of cached insights, a loading flag,
/// and optional error messaging.
class InsightsState {
  final bool isLoading;
  final List<InsightCache> insights;
  final String? latestInsight;
  final bool isFromCache;
  final String? errorMessage;

  const InsightsState({
    this.isLoading = false,
    this.insights = const [],
    this.latestInsight,
    this.isFromCache = false,
    this.errorMessage,
  });

  InsightsState copyWith({
    bool? isLoading,
    List<InsightCache>? insights,
    String? latestInsight,
    bool? isFromCache,
    String? errorMessage,
    bool clearError = false,
  }) {
    return InsightsState(
      isLoading: isLoading ?? this.isLoading,
      insights: insights ?? this.insights,
      latestInsight: latestInsight ?? this.latestInsight,
      isFromCache: isFromCache ?? this.isFromCache,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
