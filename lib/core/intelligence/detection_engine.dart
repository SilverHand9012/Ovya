import 'package:flutter/foundation.dart';

import '../../features/symptom_tracking/domain/symptom_entity.dart';

// ──────────────────────────────────────────────────────────────
//  Risk result model
// ──────────────────────────────────────────────────────────────

/// Immutable result produced by [DetectionEngine.evaluate].
class RiskResult {
  final int score;
  final String level;
  final String explanation;
  final List<String> recommendations;
  final List<String> activeSymptoms;

  /// Optional PCOS sub-type hint inferred from symptom patterns.
  ///
  /// Possible values: `'Insulin-resistant'`, `'Androgenic'`,
  /// `'Adrenal'`, or `null` (not enough signal).
  final String? pcosTypeHint;

  const RiskResult({
    required this.score,
    required this.level,
    required this.explanation,
    required this.recommendations,
    required this.activeSymptoms,
    this.pcosTypeHint,
  });

  @override
  String toString() =>
      'RiskResult(score: $score, level: $level, '
      'pcosTypeHint: $pcosTypeHint, explanation: $explanation, activeSymptoms: $activeSymptoms)';
}

// ──────────────────────────────────────────────────────────────
//  Risk level thresholds
// ──────────────────────────────────────────────────────────────

enum _RiskLevel {
  low('Low'),
  medium('Medium'),
  high('High');

  final String label;
  const _RiskLevel(this.label);
}

// ──────────────────────────────────────────────────────────────
//  Detection engine
// ──────────────────────────────────────────────────────────────

/// A deterministic, rule-based PCOS risk detection engine that
/// works fully offline without any external dependencies.
///
/// ### Scoring weights (12 symptoms, max = 23)
/// | Symptom                   | Points |
/// |---------------------------|--------|
/// | Irregular cycle           | +3     |
/// | Excess hair growth        | +3     |
/// | Family history of PCOS    | +3     |
/// | Hair thinning/loss        | +2     |
/// | Weight gain               | +2     |
/// | Acne                      | +2     |
/// | Skin darkening            | +2     |
/// | Difficulty conceiving     | +2     |
/// | Fatigue                   | +1     |
/// | Mood issues               | +1     |
/// | Sleep problems            | +1     |
/// | Bloating                  | +1     |
///
/// ### Risk classification
/// | Score range | Level  |
/// |-------------|--------|
/// | 0 – 5       | Low    |
/// | 6 – 12      | Medium |
/// | 13 +        | High   |
///
/// ### PCOS type inference
/// | Pattern                                              | Hint              |
/// |------------------------------------------------------|-------------------|
/// | Irregular cycle + Weight gain + Skin darkening       | Insulin-resistant |
/// | Excess hair growth + Acne                            | Androgenic        |
/// | Fatigue + Mood issues                                | Adrenal           |
/// | Otherwise                                            | null              |
class DetectionEngine {
  /// Symptom names mapped to their scoring weight.
  static const Map<String, int> _weights = {
    'Irregular cycle': 3,
    'Excess hair growth': 3,
    'Family history of PCOS': 3,
    'Hair thinning/loss': 2,
    'Weight gain': 2,
    'Acne': 2,
    'Skin darkening': 2,
    'Difficulty conceiving': 2,
    'Fatigue': 1,
    'Mood issues': 1,
    'Sleep problems': 1,
    'Bloating': 1,
  };

  /// Evaluates a [SymptomEntity] and returns a [RiskResult] containing
  /// the total score, risk level, a human-readable explanation,
  /// localization-key recommendations, and optional PCOS type hint.
  RiskResult evaluate(SymptomEntity symptom) {
    // 1. Build a list of active symptoms and accumulate the score.
    final List<String> activeSymptoms = [];
    int score = 0;

    void check(bool present, String name) {
      if (present) {
        activeSymptoms.add(name);
        score += _weights[name] ?? 0;
      }
    }

    check(symptom.irregularCycle, 'Irregular cycle');
    check(symptom.hairGrowth, 'Excess hair growth');
    check(symptom.familyHistory, 'Family history of PCOS');
    check(symptom.hairThinning, 'Hair thinning/loss');
    check(symptom.weightGain, 'Weight gain');
    check(symptom.acne, 'Acne');
    check(symptom.skinDarkening, 'Skin darkening');
    check(symptom.difficultyConceiving, 'Difficulty conceiving');
    check(symptom.fatigue, 'Fatigue');
    check(symptom.moodIssues, 'Mood issues');
    check(symptom.sleepProblems, 'Sleep problems');
    check(symptom.bloating, 'Bloating');

    debugPrint('[Detection] Active symptoms: $activeSymptoms');
    debugPrint('[Detection] Score: $score');

    // 2. Classify the risk level.
    final _RiskLevel risk;
    if (score >= 13) {
      risk = _RiskLevel.high;
    } else if (score >= 6) {
      risk = _RiskLevel.medium;
    } else {
      risk = _RiskLevel.low;
    }

    debugPrint('[Detection] Risk level: ${risk.label}');

    // 3. Generate explanation.
    final String explanation = _buildExplanation(activeSymptoms, risk);

    // 4. Generate recommendation keys (resolved to localized strings in UI).
    final List<String> recommendations = _buildRecommendations(risk);

    // 5. Infer PCOS sub-type hint.
    final String? typeHint = _inferType(activeSymptoms);

    debugPrint('[Detection] PCOS type hint: $typeHint');

    return RiskResult(
      score: score,
      level: risk.label,
      explanation: explanation,
      recommendations: recommendations,
      activeSymptoms: activeSymptoms,
      pcosTypeHint: typeHint,
    );
  }

  // ── Private helpers ──────────────────────────────────────────

  /// Produces a plain-language sentence listing active symptoms.
  String _buildExplanation(
    List<String> activeSymptoms,
    _RiskLevel risk,
  ) {
    if (activeSymptoms.isEmpty) {
      return 'No PCOS-related symptoms were reported. '
          'Your current risk level is Low.';
    }

    final String symptomList = _joinNatural(activeSymptoms);
    return 'Based on your reported symptoms ($symptomList), '
        'your estimated PCOS risk level is ${risk.label}.';
  }

  /// Returns localization keys for actionable suggestions
  /// tailored to the risk level.
  ///
  /// Keys are resolved to user-facing strings in the UI layer
  /// via [AppLocalizations], enabling multilingual recommendations.
  List<String> _buildRecommendations(_RiskLevel risk) {
    switch (risk) {
      case _RiskLevel.low:
        return const [
          'rec_track_regularly',
          'rec_balanced_diet',
        ];
      case _RiskLevel.medium:
        return const [
          'rec_schedule_checkup',
          'rec_monitor_cycle',
          'rec_stress_management',
        ];
      case _RiskLevel.high:
        return const [
          'rec_consult_gynecologist',
          'rec_request_bloodwork',
          'rec_symptom_diary',
        ];
    }
  }

  /// Infers a possible PCOS sub-type from the active symptom pattern.
  ///
  /// Returns `null` when there is not enough signal to classify.
  String? _inferType(List<String> activeSymptoms) {
    final has = activeSymptoms.contains;

    if (has('Irregular cycle') &&
        has('Weight gain') &&
        has('Skin darkening')) {
      return 'Insulin-resistant';
    }

    if (has('Excess hair growth') && has('Acne')) {
      return 'Androgenic';
    }

    if (has('Fatigue') && has('Mood issues')) {
      return 'Adrenal';
    }

    return null;
  }

  /// Joins a list into a natural-language string:
  /// `['A'] → 'A'`, `['A', 'B'] → 'A and B'`,
  /// `['A', 'B', 'C'] → 'A, B, and C'`.
  static String _joinNatural(List<String> items) {
    if (items.length == 1) return items.first;
    if (items.length == 2) return '${items[0]} and ${items[1]}';
    final allButLast = items.sublist(0, items.length - 1).join(', ');
    return '$allButLast, and ${items.last}';
  }
}
