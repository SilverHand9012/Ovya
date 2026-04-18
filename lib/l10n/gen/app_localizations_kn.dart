// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಓವ್ಯಾ';

  @override
  String get logSymptoms => 'ರೋಗಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿ';

  @override
  String get howAreYouFeeling => 'ಇಂದು ನೀವು ಹೇಗೆ ಅನುಭವಿಸುತ್ತಿದ್ದೀರಿ?';

  @override
  String get irregularCycle => 'ಅನಿಯಮಿತ ಋತುಚಕ್ರ';

  @override
  String get acne => 'ಮೊಡವೆ';

  @override
  String get weightGain => 'ತೂಕ ಹೆಚ್ಚಳ';

  @override
  String get excessHairGrowth => 'ಅತಿಯಾದ ಕೂದಲು ಬೆಳವಣಿಗೆ';

  @override
  String get moodIssues => 'ಮನಸ್ಥಿತಿ ಸಮಸ್ಯೆಗಳು';

  @override
  String get notesOptional => 'ಟಿಪ್ಪಣಿಗಳು (ಐಚ್ಛಿಕ)';

  @override
  String get notesHint => 'ಯಾವುದೇ ಹೆಚ್ಚುವರಿ ವಿವರಗಳು...';

  @override
  String get logSymptomsButton => 'ರೋಗಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿ';

  @override
  String get symptomsLoggedSuccess => 'ರೋಗಲಕ್ಷಣಗಳು ಯಶಸ್ವಿಯಾಗಿ ದಾಖಲಾಗಿವೆ!';

  @override
  String get history => 'ಇತಿಹಾಸ';

  @override
  String get noSymptoms => 'ರೋಗಲಕ್ಷಣಗಳಿಲ್ಲ';

  @override
  String riskLevel(String level) {
    return 'ಅಪಾಯ ಮಟ್ಟ: $level';
  }

  @override
  String score(int value) {
    return 'ಸ್ಕೋರ್: $value';
  }

  @override
  String get recommendations => 'ಶಿಫಾರಸುಗಳು';

  @override
  String get aiInsights => 'AI ಒಳನೋಟಗಳು';

  @override
  String get generateInsight => 'ಒಳನೋಟ ಉತ್ಪಾದಿಸಿ';

  @override
  String get noInsightsYet => 'ಇನ್ನೂ ಒಳನೋಟಗಳಿಲ್ಲ';

  @override
  String get noInsightsDescription =>
      'ಮೊದಲು ನಿಮ್ಮ ರೋಗಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿ, ನಂತರ\n\"ಒಳನೋಟ ಉತ್ಪಾದಿಸಿ\" ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get latestInsight => 'ಇತ್ತೀಚಿನ ಒಳನೋಟ';

  @override
  String get cached => 'ಕ್ಯಾಶ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get aiGenerated => 'AI ಉತ್ಪಾದಿತ';

  @override
  String get previousInsights => 'ಹಿಂದಿನ ಒಳನೋಟಗಳು';

  @override
  String get disclaimer =>
      'ಇದು ಮಾಹಿತಿಯ ಉದ್ದೇಶಕ್ಕಾಗಿ ಮಾತ್ರ ಮತ್ತು ವೈದ್ಯಕೀಯ ರೋಗನಿರ್ಣಯವಲ್ಲ. ದಯಮಾಡಿ ಆರೋಗ್ಯ ವೃತ್ತಿಪರರನ್ನು ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get clearCache => 'ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get viewInsights => 'ಒಳನೋಟಗಳನ್ನು ನೋಡಿ';

  @override
  String get offlineModeActive => 'ಆಫ್‌ಲೈನ್ ಮೋಡ್ ಸಕ್ರಿಯ';

  @override
  String get syncingData => 'ಡೇಟಾ ಸಿಂಕ್ ಆಗುತ್ತಿದೆ…';

  @override
  String get syncedSuccessfully => 'ಯಶಸ್ವಿಯಾಗಿ ಸಿಂಕ್ ಆಗಿದೆ';

  @override
  String get fetchingInsights => 'ಹೊಸ ಒಳನೋಟಗಳನ್ನು ಪಡೆಯಲಾಗುತ್ತಿದೆ…';

  @override
  String get usingLastSaved => 'ಕೊನೆಯ ಉಳಿಸಿದ ಒಳನೋಟಗಳನ್ನು ಬಳಸಲಾಗುತ್ತಿದೆ';

  @override
  String get offlineShowingLast =>
      'ನಾವು ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದೇವೆ. ನಿಮ್ಮ ಕೊನೆಯ ಒಳನೋಟಗಳನ್ನು ತೋರಿಸುತ್ತಿದ್ದೇವೆ.';

  @override
  String get failedToLoad => 'ಲೋಡ್ ಮಾಡಲು ವಿಫಲ';

  @override
  String get failedToAdd => 'ಸೇರಿಸಲು ವಿಫಲ';

  @override
  String get failedToGenerate => 'ಉತ್ಪಾದಿಸಲು ವಿಫಲ';

  @override
  String get rec_track_regularly =>
      'ಮುಂಚಿತವಾಗಿ ಗುರುತಿಸಲು ನಿಮ್ಮ ರೋಗಲಕ್ಷಣಗಳನ್ನು ನಿಯಮಿತವಾಗಿ ದಾಖಲಿಸುತ್ತಿರಿ.';

  @override
  String get rec_balanced_diet =>
      'ಸಮತೋಲಿತ ಆಹಾರ ಮತ್ತು ನಿಯಮಿತ ವ್ಯಾಯಾಮವನ್ನು ಅನುಸರಿಸಿ.';

  @override
  String get rec_schedule_checkup =>
      'ನಿಮ್ಮ ವೈದ್ಯರೊಂದಿಗೆ ತಪಾಸಣೆಗೆ ಸಮಯ ನಿಗದಿಪಡಿಸಲು ಪರಿಗಣಿಸಿ.';

  @override
  String get rec_monitor_cycle =>
      'ನಿಮ್ಮ ಋತುಚಕ್ರವನ್ನು ಹತ್ತಿರದಿಂದ ಗಮನಿಸಿ ಮತ್ತು ಯಾವುದೇ ಅನಿಯಮಿತತೆಯನ್ನು ಗಮನಿಸಿ.';

  @override
  String get rec_stress_management =>
      'ಯೋಗ ಅಥವಾ ಧ್ಯಾನದಂತಹ ಒತ್ತಡ ನಿರ್ವಹಣೆ ತಂತ್ರಗಳನ್ನು ಅಳವಡಿಸಿಕೊಳ್ಳಿ.';

  @override
  String get rec_consult_gynecologist =>
      'ದಯವಿಟ್ಟು ಸಾಧ್ಯವಾದಷ್ಟು ಬೇಗ ಸ್ತ್ರೀರೋಗ ತಜ್ಞರನ್ನು ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get rec_request_bloodwork =>
      'ಹಾರ್ಮೋನ್ ಪ್ಯಾನಲ್ ಮತ್ತು ಇನ್ಸುಲಿನ್ ಮಟ್ಟಗಳ ರಕ್ತ ಪರೀಕ್ಷೆ ಮಾಡಿಸಿ.';

  @override
  String get rec_symptom_diary =>
      'ನಿಮ್ಮ ವೈದ್ಯರೊಂದಿಗೆ ಹಂಚಿಕೊಳ್ಳಲು ವಿವರವಾದ ರೋಗಲಕ್ಷಣ ಡೈರಿ ಇಡಿ.';
}
