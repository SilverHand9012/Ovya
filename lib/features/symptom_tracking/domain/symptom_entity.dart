/// Domain entity representing a symptom log entry.
///
/// Each field corresponds to a PCOS-relevant symptom indicator
/// used by [DetectionEngine] for offline risk evaluation.
class SymptomEntity {
  final String id;
  final DateTime timestamp;
  final bool irregularCycle;
  final bool acne;
  final bool weightGain;
  final bool hairGrowth;
  final bool moodIssues;
  final String? notes;

  const SymptomEntity({
    required this.id,
    required this.timestamp,
    this.irregularCycle = false,
    this.acne = false,
    this.weightGain = false,
    this.hairGrowth = false,
    this.moodIssues = false,
    this.notes,
  });
}
