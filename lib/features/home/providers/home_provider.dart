import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/intelligence/detection_engine.dart';
import '../../symptom_tracking/providers/symptom_notifier.dart';

class HomeState {
  final RiskResult? latestRiskResult;
  final bool hasLoggedToday;
  final DateTime? lastSyncTime;
  final String? firstName;

  const HomeState({
    this.latestRiskResult,
    this.hasLoggedToday = false,
    this.lastSyncTime,
    this.firstName,
  });

  HomeState copyWith({
    RiskResult? latestRiskResult,
    bool? hasLoggedToday,
    DateTime? lastSyncTime,
    String? firstName,
  }) {
    return HomeState(
      latestRiskResult: latestRiskResult ?? this.latestRiskResult,
      hasLoggedToday: hasLoggedToday ?? this.hasLoggedToday,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      firstName: firstName ?? this.firstName,
    );
  }
}

class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    // Watch symptom provider so HomeState reacts to changes in symptoms
    final symptomState = ref.watch(symptomNotifierProvider);

    final prefs = await SharedPreferences.getInstance();
    final lastSyncStr = prefs.getString('lastSyncTime');
    final lastSyncTime = lastSyncStr != null ? DateTime.tryParse(lastSyncStr) : null;
    
    // Extract a first name nicely
    final rawName = prefs.getString('patient_name');
    final firstName = (rawName != null && rawName.trim().isNotEmpty) ? rawName.trim().split(' ').first : null;

    final hasLoggedToday = _checkIfLoggedToday(symptomState.symptoms.map((e) => e.timestamp).toList());

    return HomeState(
      latestRiskResult: symptomState.riskResult,
      hasLoggedToday: hasLoggedToday,
      lastSyncTime: lastSyncTime,
      firstName: firstName,
    );
  }

  bool _checkIfLoggedToday(List<DateTime> timestamps) {
    if (timestamps.isEmpty) return false;
    final latest = timestamps.first; // Usually ordered newest first
    final now = DateTime.now();
    return latest.year == now.year && latest.month == now.month && latest.day == now.day;
  }
}

final homeProvider = AsyncNotifierProvider<HomeNotifier, HomeState>(() {
  return HomeNotifier();
});
