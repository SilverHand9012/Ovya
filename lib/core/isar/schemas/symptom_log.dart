import 'package:isar/isar.dart';

part 'symptom_log.g.dart';

/// Isar collection schema for symptom log entries.
///
/// Maps directly to/from [SymptomEntity] in the domain layer.
/// Each boolean field tracks a PCOS-relevant symptom indicator.
@collection
class SymptomLog {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime timestamp;

  // ── Original symptoms ───────────────────────────────────────
  late bool irregularCycle;
  late bool acne;
  late bool weightGain;
  late bool hairGrowth;
  late bool moodIssues;

  // ── Extended symptoms ───────────────────────────────────────
  late bool hairThinning;
  late bool skinDarkening;
  late bool fatigue;
  late bool sleepProblems;
  late bool bloating;
  late bool familyHistory;
  late bool difficultyConceiving;

  String? notes;

  late bool synced = false;

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
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
