// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Ovya';

  @override
  String get logSymptoms => 'Log Symptoms';

  @override
  String get howAreYouFeeling => 'How are you feeling today?';

  @override
  String get irregularCycle => 'Irregular Cycle';

  @override
  String get acne => 'Acne';

  @override
  String get weightGain => 'Weight Gain';

  @override
  String get excessHairGrowth => 'Excess Hair Growth';

  @override
  String get moodIssues => 'Mood Issues';

  @override
  String get notesOptional => 'Notes (optional)';

  @override
  String get notesHint => 'Any additional details...';

  @override
  String get logSymptomsButton => 'Log Symptoms';

  @override
  String get symptomsLoggedSuccess => 'Symptoms logged successfully!';

  @override
  String get history => 'History';

  @override
  String get noSymptoms => 'No symptoms';

  @override
  String riskLevel(String level) {
    return 'Risk Level: $level';
  }

  @override
  String score(int value) {
    return 'Score: $value';
  }

  @override
  String get recommendations => 'Recommendations';

  @override
  String get aiInsights => 'AI Insights';

  @override
  String get generateInsight => 'Generate Insight';

  @override
  String get noInsightsYet => 'No insights yet';

  @override
  String get noInsightsDescription =>
      'Log your symptoms first, then tap\n\"Generate Insight\" for personalised advice.';

  @override
  String get latestInsight => 'Latest Insight';

  @override
  String get cached => 'Cached';

  @override
  String get aiGenerated => 'AI Generated';

  @override
  String get previousInsights => 'Previous Insights';

  @override
  String get disclaimer =>
      'This is informational only and not a medical diagnosis. Please consult a healthcare professional.';

  @override
  String get clearCache => 'Clear cache';

  @override
  String get viewInsights => 'View Insights';

  @override
  String get offlineModeActive => 'Offline mode active';

  @override
  String get syncingData => 'Syncing data…';

  @override
  String get syncedSuccessfully => 'Synced successfully';

  @override
  String get fetchingInsights => 'Fetching new insights…';

  @override
  String get usingLastSaved => 'Using last saved insights';

  @override
  String get offlineShowingLast =>
      'We\'re offline. Showing your last insights.';

  @override
  String get failedToLoad => 'Failed to load';

  @override
  String get failedToAdd => 'Failed to add';

  @override
  String get failedToGenerate => 'Failed to generate';
}
