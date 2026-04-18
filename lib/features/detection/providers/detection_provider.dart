import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../symptom_tracking/domain/symptom_entity.dart';
import '../../../core/intelligence/detection_engine.dart';

class DetectionNotifier extends Notifier<Map<String, bool>> {
  @override
  Map<String, bool> build() => {};

  void answerQuestion(String key, bool value) {
    state = {...state, key: value};
  }

  void reset() {
    state = {};
  }

  RiskResult computeResult() {
    final s = state;
    final entity = SymptomEntity(
      id: DateTime.now().toIso8601String(),
      timestamp: DateTime.now(),
      irregularCycle: s['irregularCycle'] ?? false,
      hairGrowth: s['hairGrowth'] ?? false,
      familyHistory: s['familyHistory'] ?? false,
      weightGain: s['weightGain'] ?? false,
      acne: s['acne'] ?? false,
      skinDarkening: s['skinDarkening'] ?? false,
      hairThinning: s['hairThinning'] ?? false,
      fatigue: s['fatigue'] ?? false,
      sleepProblems: s['sleepProblems'] ?? false,
      bloating: s['bloating'] ?? false,
      moodIssues: s['moodIssues'] ?? false,
      difficultyConceiving: s['difficultyConceiving'] ?? false,
    );

    return DetectionEngine().evaluate(entity);
  }
}

final detectionProvider = NotifierProvider<DetectionNotifier, Map<String, bool>>(() {
  return DetectionNotifier();
});
