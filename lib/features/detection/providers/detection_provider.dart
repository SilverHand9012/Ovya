import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../symptom_tracking/domain/symptom_entity.dart';
import '../../../core/intelligence/detection_engine.dart';

class DetectionNotifier extends Notifier<Map<String, bool>> {
  static const _prefsKey = 'ovya_assessment_data';

  @override
  Map<String, bool> build() {
    _loadFromPrefs();
    return {};
  }

  Future<void> _loadFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final str = prefs.getString(_prefsKey);
      if (str != null) {
        final decoded = jsonDecode(str) as Map<String, dynamic>;
        state = decoded.map((k, v) => MapEntry(k, v as bool));
      }
    } catch (_) {}
  }

  Future<void> _saveToPrefs(Map<String, bool> data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, jsonEncode(data));
    } catch (_) {}
  }

  void answerQuestion(String key, bool value) {
    state = {...state, key: value};
    _saveToPrefs(state);
  }

  void reset() {
    state = {};
    _saveToPrefs(state);
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
