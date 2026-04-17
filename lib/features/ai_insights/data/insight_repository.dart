import '../../../core/connectivity/connectivity_orchestrator.dart';
import '../../../core/isar/schemas/insight_cache.dart';

import '../../../main.dart' show languageService;
import '../../symptom_tracking/data/symptom_repository.dart';
import 'insight_cache_service.dart';

// ──────────────────────────────────────────────────────────────
//  Abstract contract
// ──────────────────────────────────────────────────────────────

/// Defines the operations the insight data layer must support.
abstract class InsightRepository {
  /// Gets all cached insights.
  Future<List<InsightCache>> getInsights();

  /// Generates a new insight (AI when online, cached when offline).
  Future<String> generateInsight();

  /// Caches an insight locally.
  Future<void> cacheInsight(String insightText, {bool isFromAi});

  /// Clears the entire insight cache.
  Future<void> clearCache();
}

// ──────────────────────────────────────────────────────────────
//  Concrete implementation
// ──────────────────────────────────────────────────────────────

/// Combines [ConnectivityOrchestrator], [InsightCacheService],
/// and [SymptomRepository] to produce AI insights online and
/// fall back to cached results when offline.
class InsightRepositoryImpl implements InsightRepository {
  final ConnectivityOrchestrator _orchestrator;
  final InsightCacheService _cacheService;
  final SymptomRepository _symptomRepository;

  InsightRepositoryImpl({
    ConnectivityOrchestrator? orchestrator,
    InsightCacheService? cacheService,
    SymptomRepository? symptomRepository,
  })  : _orchestrator = orchestrator ?? ConnectivityOrchestrator(),
        _cacheService = cacheService ?? InsightCacheService(),
        _symptomRepository =
            symptomRepository ?? SymptomRepositoryImpl();

  @override
  Future<List<InsightCache>> getInsights() async {
    return _cacheService.getAllInsights();
  }

  @override
  Future<String> generateInsight() async {
    // 1. Get the latest symptom entry.
    final latestSymptom = await _symptomRepository.getLatestLog();

    if (latestSymptom == null) {
      return 'No symptom data available yet. '
          'Log your symptoms first to receive personalised insights.';
    }

    // 2. Run detection engine to get risk level.
    final riskResult = _orchestrator.runDetection(latestSymptom);

    // 3. Fetch insight (online → Gemini, offline → cache/fallback).
    final cachedEntry = await _cacheService.getLatestInsight();
    final langCode = languageService.getCurrentLanguage();
    final insight = await _orchestrator.fetchInsights(
      symptom: latestSymptom,
      riskLevel: riskResult.level,
      cachedInsight: cachedEntry?.insightText,
      languageCode: langCode,
    );

    // 4. Cache the new insight if it came from AI.
    final isOnline = await _orchestrator.isOnline;
    if (isOnline) {
      await _cacheService.saveInsight(insight, isFromAi: true);
    }

    return insight;
  }

  @override
  Future<void> cacheInsight(String insightText, {bool isFromAi = false}) async {
    await _cacheService.saveInsight(insightText, isFromAi: isFromAi);
  }

  @override
  Future<void> clearCache() async {
    await _cacheService.clearAll();
  }
}
