import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../features/symptom_tracking/domain/symptom_entity.dart';
import '../constants.dart';
import '../services/language_service.dart';

// ──────────────────────────────────────────────────────────────
//  Gemini service
// ──────────────────────────────────────────────────────────────

/// Handles all Gemini API calls for AI-powered PCOS insights.
///
/// Sends a structured prompt containing the user's symptom data,
/// risk level, and preferred language, then returns a plain-text
/// response with lifestyle and health recommendations.
class GeminiService {
  GenerativeModel? _model;

  /// Lazily initialises the Gemini model. Returns `null` if the
  /// API key has not been configured yet.
  GenerativeModel? get _generativeModel {
    const apiKey = AppConstants.geminiApiKey;
    if (apiKey.isEmpty) return null;

    _model ??= GenerativeModel(
      model: AppConstants.geminiModel,
      apiKey: apiKey,
    );
    return _model;
  }

  // ── Public API ───────────────────────────────────────────────

  /// Generates structured AI insights based on the user's
  /// [symptom] data, current [riskLevel], and preferred
  /// [languageCode].
  ///
  /// The [languageCode] parameter (e.g. 'en', 'hi', 'kn')
  /// controls the language of the Gemini response.
  ///
  /// Returns a plain-text response containing:
  /// - A short explanation of the assessment
  /// - 3 lifestyle tips
  /// - 2 diet suggestions
  /// - 1 mental health tip
  ///
  /// Throws [GeminiServiceException] on failure.
  Future<String> generateInsights({
    required SymptomEntity symptom,
    required String riskLevel,
    String languageCode = 'en',
  }) async {
    final model = _generativeModel;
    if (model == null) {
      throw const GeminiServiceException(
        'Gemini API key is not configured. '
        'Set AppConstants.geminiApiKey to enable AI insights.',
      );
    }

    final prompt = _buildPrompt(symptom, riskLevel, languageCode);

    try {
      debugPrint('[AI] Fetching insights from Gemini (risk: $riskLevel, lang: $languageCode)...');
      final response = await model
          .generateContent([Content.text(prompt)])
          .timeout(const Duration(seconds: 30));

      final text = response.text;
      if (text == null || text.isEmpty) {
        debugPrint('[AI] Gemini returned empty response.');
        throw const GeminiServiceException(
          'Gemini returned an empty response.',
        );
      }

      debugPrint('[AI] Insight received (${text.length} chars).');
      return text;
    } on GeminiServiceException {
      rethrow;
    } catch (e) {
      debugPrint('[AI] Gemini API call failed: $e');
      throw GeminiServiceException('Gemini API call failed: $e');
    }
  }

  // ── Prompt builder ───────────────────────────────────────────

  /// Constructs a detailed prompt for the Gemini model,
  /// including the user's preferred response language.
  String _buildPrompt(
    SymptomEntity symptom,
    String riskLevel,
    String languageCode,
  ) {
    final activeSymptoms = <String>[];
    if (symptom.irregularCycle) activeSymptoms.add('Irregular menstrual cycle');
    if (symptom.acne) activeSymptoms.add('Acne breakouts');
    if (symptom.weightGain) activeSymptoms.add('Unexplained weight gain');
    if (symptom.hairGrowth) activeSymptoms.add('Excess hair growth');
    if (symptom.moodIssues) activeSymptoms.add('Mood swings / anxiety');
    if (symptom.hairThinning) activeSymptoms.add('Hair thinning or loss');
    if (symptom.skinDarkening) activeSymptoms.add('Dark patches on skin');
    if (symptom.fatigue) activeSymptoms.add('Chronic fatigue');
    if (symptom.sleepProblems) activeSymptoms.add('Poor sleep quality');
    if (symptom.bloating) activeSymptoms.add('Abdominal bloating');
    if (symptom.familyHistory) activeSymptoms.add('Family history of PCOS');
    if (symptom.difficultyConceiving) activeSymptoms.add('Difficulty conceiving');

    final symptomList = activeSymptoms.isEmpty
        ? 'No active symptoms reported.'
        : activeSymptoms.join(', ');

    final languageName =
        LanguageService.languageNames[languageCode] ?? 'English';

    return '''
You are a women's health assistant specialising in PCOS (Polycystic Ovary Syndrome).

The user has logged the following symptoms: $symptomList.
Their estimated PCOS risk level is: $riskLevel.

Please provide:
1. A short, empathetic explanation of their current assessment.
2. 3 practical lifestyle tips relevant to their symptoms.
3. 2 diet suggestions that may help manage PCOS.
4. 1 mental health tip.

Respond in $languageName.
Use simple, clear language suitable for general users.

Keep your response supportive and under 300 words.
Do NOT include disclaimers about not being a doctor — the app UI handles that.
''';
  }
}

// ──────────────────────────────────────────────────────────────
//  Custom exception
// ──────────────────────────────────────────────────────────────

/// Thrown when a [GeminiService] operation fails.
class GeminiServiceException implements Exception {
  final String message;
  const GeminiServiceException(this.message);

  @override
  String toString() => 'GeminiServiceException: $message';
}
