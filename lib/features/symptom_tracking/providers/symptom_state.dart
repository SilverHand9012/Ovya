import '../domain/symptom_entity.dart';
import '../../../core/intelligence/detection_engine.dart';

/// Immutable state class for symptom tracking.
///
/// Holds the current list of logged symptoms, the latest risk
/// evaluation result, and loading / error flags.
class SymptomState {
  final bool isLoading;
  final List<SymptomEntity> symptoms;
  final RiskResult? riskResult;
  final String? errorMessage;

  const SymptomState({
    this.isLoading = false,
    this.symptoms = const [],
    this.riskResult,
    this.errorMessage,
  });

  SymptomState copyWith({
    bool? isLoading,
    List<SymptomEntity>? symptoms,
    RiskResult? riskResult,
    String? errorMessage,
    bool clearError = false,
    bool clearRisk = false,
  }) {
    return SymptomState(
      isLoading: isLoading ?? this.isLoading,
      symptoms: symptoms ?? this.symptoms,
      riskResult: clearRisk ? null : (riskResult ?? this.riskResult),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
