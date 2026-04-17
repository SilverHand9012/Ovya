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

  late bool irregularCycle;
  late bool acne;
  late bool weightGain;
  late bool hairGrowth;
  late bool moodIssues;

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
      'notes': notes,
    };
  }
}
