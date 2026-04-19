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
  final String? clientId;
  final DateTime timestamp;
  final DateTime updatedAt;
  final bool isDeleted;
  final String? deviceId;

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

  SymptomEntity({
    required this.id,
    this.clientId,
    required this.timestamp,
    DateTime? updatedAt,
    this.isDeleted = false,
    this.deviceId,
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
  }) : updatedAt = updatedAt ?? DateTime.now();

  SymptomEntity copyWith({
    String? id,
    String? clientId,
    DateTime? timestamp,
    DateTime? updatedAt,
    bool? isDeleted,
    String? deviceId,
    bool? irregularCycle,
    bool? acne,
    bool? weightGain,
    bool? hairGrowth,
    bool? moodIssues,
    bool? hairThinning,
    bool? skinDarkening,
    bool? fatigue,
    bool? sleepProblems,
    bool? bloating,
    bool? familyHistory,
    bool? difficultyConceiving,
    String? notes,
  }) {
    return SymptomEntity(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      timestamp: timestamp ?? this.timestamp,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      deviceId: deviceId ?? this.deviceId,
      irregularCycle: irregularCycle ?? this.irregularCycle,
      acne: acne ?? this.acne,
      weightGain: weightGain ?? this.weightGain,
      hairGrowth: hairGrowth ?? this.hairGrowth,
      moodIssues: moodIssues ?? this.moodIssues,
      hairThinning: hairThinning ?? this.hairThinning,
      skinDarkening: skinDarkening ?? this.skinDarkening,
      fatigue: fatigue ?? this.fatigue,
      sleepProblems: sleepProblems ?? this.sleepProblems,
      bloating: bloating ?? this.bloating,
      familyHistory: familyHistory ?? this.familyHistory,
      difficultyConceiving: difficultyConceiving ?? this.difficultyConceiving,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'timestamp': timestamp.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isDeleted': isDeleted,
      'deviceId': deviceId,
      'irregularCycle': irregularCycle,
      'acne': acne,
      'weightGain': weightGain,
      'hairGrowth': hairGrowth,
      'moodIssues': moodIssues,
      'hairThinning': hairThinning,
      'skinDarkening': skinDarkening,
      'fatigue': fatigue,
      'sleepProblems': sleepProblems,
      'bloating': bloating,
      'familyHistory': familyHistory,
      'difficultyConceiving': difficultyConceiving,
      'notes': notes,
    };
  }
}
