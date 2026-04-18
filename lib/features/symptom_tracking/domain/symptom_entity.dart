/// Domain entity representing a symptom log entry.
///
/// Each field corresponds to a PCOS-relevant symptom indicator
/// used by [DetectionEngine] for offline risk evaluation.
///
/// ### Original symptoms (5)
/// [irregularCycle], [acne], [weightGain], [hairGrowth], [moodIssues]
///
/// ### Extended symptoms (7 new)
/// [hairThinning], [skinDarkening], [fatigue], [sleepProblems],
/// [bloating], [familyHistory], [difficultyConceiving]
class SymptomEntity {
  final String id;
  final DateTime timestamp;

  // ── Original boolean symptoms ─────────────────────────────────
  final bool irregularCycle;
  final bool acne;
  final bool weightGain;
  final bool hairGrowth;
  final bool moodIssues;

  // ── Extended boolean symptoms ─────────────────────────────────
  /// Hair thinning or loss on the scalp.
  final bool hairThinning;

  /// Dark patches on the skin (acanthosis nigricans).
  final bool skinDarkening;

  /// Chronic or unexplained fatigue.
  final bool fatigue;

  /// Poor sleep quality or insomnia.
  final bool sleepProblems;

  /// Abdominal bloating.
  final bool bloating;

  /// Family history of PCOS or related metabolic disorders.
  final bool familyHistory;

  /// Difficulty conceiving — only scored when the user confirms
  /// age > 18 and is actively trying to conceive.
  final bool difficultyConceiving;

  // ── Free-text notes ───────────────────────────────────────────
  final String? notes;

  const SymptomEntity({
    required this.id,
    required this.timestamp,
    this.irregularCycle = false,
    this.acne = false,
    this.weightGain = false,
    this.hairGrowth = false,
    this.moodIssues = false,
    this.hairThinning = false,
    this.skinDarkening = false,
    this.fatigue = false,
    this.sleepProblems = false,
    this.bloating = false,
    this.familyHistory = false,
    this.difficultyConceiving = false,
    this.notes,
  });
}
