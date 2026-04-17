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

  const RiskResult({
    required this.score,
    required this.level,
    required this.explanation,
    required this.recommendations,
  });

  @override
  String toString() =>
      'RiskResult(score: $score, level: $level, explanation: $explanation)';
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
/// ### Scoring weights
/// | Symptom          | Points |
/// |------------------|--------|
/// | Irregular cycle  | +3     |
/// | Acne             | +2     |
/// | Weight gain      | +2     |
/// | Excess hair      | +3     |
/// | Mood issues      | +1     |
///
/// ### Risk classification
/// | Score range | Level  |
/// |-------------|--------|
/// | 0 – 3       | Low    |
/// | 4 – 6       | Medium |
/// | 7 +         | High   |
class DetectionEngine {
  /// Symptom names mapped to their scoring weight.
  static const Map<String, int> _weights = {
    'Irregular cycle': 3,
    'Acne': 2,
    'Weight gain': 2,
    'Excess hair growth': 3,
    'Mood issues': 1,
  };

  /// Evaluates a [SymptomEntity] and returns a [RiskResult] containing
  /// the total score, risk level, a human-readable explanation, and
  /// actionable recommendations.
  RiskResult evaluate(SymptomEntity symptom) {
    // 1. Build a list of active symptoms and accumulate the score.
    final List<String> activeSymptoms = [];
    int score = 0;

    void check(bool present, String name) {
      if (present) {
        activeSymptoms.add(name);
        score += _weights[name]!;
      }
    }

    check(symptom.irregularCycle, 'Irregular cycle');
    check(symptom.acne, 'Acne');
    check(symptom.weightGain, 'Weight gain');
    check(symptom.hairGrowth, 'Excess hair growth');
    check(symptom.moodIssues, 'Mood issues');

    debugPrint('[Detection] Active symptoms: $activeSymptoms');
    debugPrint('[Detection] Score: $score');

    // 2. Classify the risk level.
    final _RiskLevel risk;
    if (score >= 7) {
      risk = _RiskLevel.high;
    } else if (score >= 4) {
      risk = _RiskLevel.medium;
    } else {
      risk = _RiskLevel.low;
    }

    debugPrint('[Detection] Risk level: ${risk.label}');

    // 3. Generate explanation.
    final String explanation = _buildExplanation(activeSymptoms, risk);

    // 4. Generate recommendations.
    final List<String> recommendations = _buildRecommendations(risk);

    return RiskResult(
      score: score,
      level: risk.label,
      explanation: explanation,
      recommendations: recommendations,
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

  /// Returns 2-3 actionable suggestions tailored to the risk level.
  List<String> _buildRecommendations(_RiskLevel risk) {
    switch (risk) {
      case _RiskLevel.low:
        return const [
          'Continue tracking your symptoms regularly for early detection.',
          'Maintain a balanced diet and consistent exercise routine.',
        ];
      case _RiskLevel.medium:
        return const [
          'Consider scheduling a check-up with your healthcare provider.',
          'Monitor your menstrual cycle closely and note any irregularities.',
          'Incorporate stress-management techniques like yoga or meditation.',
        ];
      case _RiskLevel.high:
        return const [
          'Please consult a gynecologist or endocrinologist as soon as possible.',
          'Request blood work including hormone panel and insulin levels.',
          'Keep a detailed symptom diary to share with your doctor.',
        ];
    }
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
