// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Ovya';

  @override
  String get continueText => 'ಮುಂದುವರಿಸಿ';

  @override
  String get auth_sign_in => 'ಸೈನ್ ಇನ್';

  @override
  String get auth_sign_up => 'ಸೈನ್ ಅಪ್';

  @override
  String get auth_email => 'ಇಮೇಲ್';

  @override
  String get auth_password => 'ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get auth_confirm_password => 'ಪಾಸ್‌ವರ್ಡ್ ಖಚಿತಪಡಿಸಿ';

  @override
  String get auth_error_passwords_no_match =>
      'ಪಾಸ್‌ವರ್ಡ್‌ಗಳು ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ';

  @override
  String get auth_create_account => 'ಖಾತೆ ರಚಿಸಿ';

  @override
  String get auth_loading => 'ಲೋಡ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get logSymptoms => 'ರೋಗಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿ';

  @override
  String get howAreYouFeeling => 'ಇಂದು ನಿಮಗೆ ಹೇಗನಿಸುತ್ತಿದೆ?';

  @override
  String get irregularCycle => 'ಅನಿಯಮಿತ ಮುಟ್ಟು';

  @override
  String get acne => 'ಮೊಡವೆ (Acne)';

  @override
  String get weightGain => 'ತೂಕ ಹೆಚ್ಚಳ';

  @override
  String get excessHairGrowth => 'ಅತಿಯಾದ ಕೂದಲು ಬೆಳವಣಿಗೆ';

  @override
  String get moodIssues => 'ಮೂಡ್ ಬದಲಾವಣೆ';

  @override
  String get notesOptional => 'ಟಿಪ್ಪಣಿಗಳು (ಐಚ್ಛಿಕ)';

  @override
  String get notesHint => 'ಯಾವುದೇ ಇತರ ಮಾಹಿತಿ...';

  @override
  String get logSymptomsButton => 'ರೋಗಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿ';

  @override
  String get symptomsLoggedSuccess => 'ಯಶಸ್ವಿಯಾಗಿ ದಾಖಲಿಸಲಾಗಿದೆ!';

  @override
  String get history => 'ಇತಿಹಾಸ';

  @override
  String get noSymptoms => 'ಯಾವುದೇ ರೋಗಲಕ್ಷಣಗಳಿಲ್ಲ';

  @override
  String riskLevel(String level) {
    return 'ಅಪಾಯದ ಮಟ್ಟ: $level';
  }

  @override
  String score(int value) {
    return 'ಸ್ಕೋರ್: $value';
  }

  @override
  String get recommendations => 'ಸಲಹೆಗಳು';

  @override
  String get aiInsights => 'AI ಮಾಹಿತಿಗಳು';

  @override
  String get generateInsight => 'ಮಾಹಿತಿ ಪಡೆಯಿರಿ';

  @override
  String get noInsightsYet => 'ಇನ್ನೂ ಯಾವುದೇ ಮಾಹಿತಿ ಇಲ್ಲ';

  @override
  String get noInsightsDescription =>
      'ಮೊದಲು ರೋಗಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿ, ನಂತರ ಸಲಹೆ ಪಡೆಯಲು ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get latestInsight => 'ಇತ್ತೀಚಿನ ಮಾಹಿತಿ';

  @override
  String get cached => 'ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get aiGenerated => 'AI ರಚಿಸಿದೆ';

  @override
  String get previousInsights => 'ಹಿಂದಿನ ಮಾಹಿತಿಗಳು';

  @override
  String get disclaimer =>
      'ಇದು ಕೇವಲ ಮಾಹಿತಿಗಾಗಿ. ದಯವಿಟ್ಟು ವೈದ್ಯರನ್ನು ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get clearCache => 'ಕ್ಯಾಶ್ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get viewInsights => 'ಮಾಹಿತಿ ನೋಡಿ';

  @override
  String get offlineModeActive => 'ಆಫ್‌ಲೈನ್ ಮೋಡ್ ಸಕ್ರಿಯವಾಗಿದೆ';

  @override
  String get syncingData => 'ಡೇಟಾ ಸಿಂಕ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get syncedSuccessfully => 'ಸಿಂಕ್ ಯಶಸ್ವಿಯಾಗಿದೆ';

  @override
  String get fetchingInsights => 'ಹೊಸ ಮಾಹಿತಿ ತರಲಾಗುತ್ತಿದೆ...';

  @override
  String get usingLastSaved => 'ಉಳಿಸಿದ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಲಾಗುತ್ತಿದೆ';

  @override
  String get offlineShowingLast =>
      'ನಾವು ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದೇವೆ. ಹಿಂದಿನ ಮಾಹಿತಿಯನ್ನು ತೋರಿಸಲಾಗುತ್ತಿದೆ.';

  @override
  String get failedToLoad => 'ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get failedToAdd => 'ಸೇರಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get failedToGenerate => 'ರಚಿಸಲು ವಿಫಲವಾಗಿದೆ';

  @override
  String get rec_track_regularly => 'ನಿಮ್ಮ ರೋಗಲಕ್ಷಣಗಳನ್ನು ನಿಯಮಿತವಾಗಿ ಗಮನಿಸಿ.';

  @override
  String get rec_balanced_diet => 'ಉತ್ತಮ ಆಹಾರ ಮತ್ತು ವ್ಯಾಯಾಮವನ್ನು ರೂಢಿಸಿಕೊಳ್ಳಿ.';

  @override
  String get rec_schedule_checkup => 'ನಿಮ್ಮ ವೈದ್ಯರನ್ನು ಭೇಟಿ ಮಾಡಲು ಪರಿಗಣಿಸಿ.';

  @override
  String get rec_monitor_cycle => 'ನಿಮ್ಮ ಮುಟ್ಟಿನ ಚಕ್ರವನ್ನು ಸೂಕ್ಷ್ಮವಾಗಿ ಗಮನಿಸಿ.';

  @override
  String get rec_stress_management => 'ಒತ್ತಡ ನಿವಾರಣೆಗೆ ಯೋಗ ಮತ್ತು ಧ್ಯಾನ ಮಾಡಿ.';

  @override
  String get rec_consult_gynecologist =>
      'ದಯವಿಟ್ಟು ಸ್ತ್ರೀರೋಗ ತಜ್ಞರನ್ನು (Gynecologist) ಆದಷ್ಟು ಬೇಗ ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get rec_request_bloodwork =>
      'ಹಾರ್ಮೋನ್ ಮತ್ತು ಇನ್ಸುಲಿನ್ ಮಟ್ಟವನ್ನು ಪರೀಕ್ಷಿಸಲು ರಕ್ತ ಪರೀಕ್ಷೆ ಮಾಡಿಸಿ.';

  @override
  String get rec_symptom_diary =>
      'ನಿಮ್ಮ ವೈದ್ಯರೊಂದಿಗೆ ಹಂಚಿಕೊಳ್ಳಲು ರೋಗಲಕ್ಷಣಗಳ ಡೈರಿಯನ್ನು ಇಟ್ಟುಕೊಳ್ಳಿ.';

  @override
  String get q_irregular_cycle => 'ನಿಮ್ಮ ಮುಟ್ಟಿನ ಚಕ್ರವು ಅನಿಯಮಿತವಾಗಿದೆಯೇ?';

  @override
  String get q_hair_growth =>
      'ನಿಮ್ಮ ಮುಖ ಅಥವಾ ದೇಹದ ಮೇಲೆ ಅತಿಯಾದ ಕೂದಲು ಬೆಳೆಯುತ್ತಿದೆಯೇ?';

  @override
  String get q_family_history =>
      'ನಿಮ್ಮ ಕುಟುಂಬದಲ್ಲಿ ಯಾರಿಗಾದರೂ ಪಾಲಿಸಿಸ್ಟಿಕ್ ಓವರಿ ಸಿಂಡ್ರೋಮ್ (PCOS) ಇದೆಯೇ?';

  @override
  String get q_weight_gain => 'ಕಾರಣವಿಲ್ಲದೆ ತೂಕ ಹೆಚ್ಚಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_acne => 'ನಿಮಗೆ ಸತತವಾಗಿ ಮೊಡವೆಗಳು ಬರುತ್ತಿವೆಯೇ?';

  @override
  String get q_skin_darkening =>
      'ವಿನಾಕಾರಣ ಚರ್ಮದ ಮೇಲೆ ಕಪ್ಪು ಕಲೆಗಳು ಮೂಡುತ್ತಿವೆಯೇ?';

  @override
  String get q_hair_thinning =>
      'ನಿಮ್ಮ ಕೂದಲು ಉದುರುತ್ತಿದೆಯೇ ಅಥವಾ ತೆಳುವಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_fatigue => 'ನೀವು ಆಗಾಗ್ಗೆ ಸುಸ್ತಾಗುತ್ತೀರಾ?';

  @override
  String get q_sleep_problems => 'ನಿಮಗೆ ನಿದ್ರೆ ಮಾಡಲು ತೊಂದರೆ ಇದೆಯೇ?';

  @override
  String get q_bloating => 'ನಿಮಗೆ ಆಗಾಗ್ಗೆ ಹೊಟ್ಟೆ ಉಬ್ಬರ ಆಗುತ್ತದೆಯೇ?';

  @override
  String get q_mood_issues => 'ನಿಮ್ಮ ಮೂಡ್ ಆಗಾಗ್ಗೆ ಬದಲಾಗುತ್ತದೆಯೇ?';

  @override
  String get q_difficulty_conceiving => 'ಗರ್ಭ ಧರಿಸಲು ಸ್ವಲ್ಪ ಕಷ್ಟವಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_age_verification =>
      'ನಿಮಗೆ 18 ವರ್ಷ ಅಥವಾ ಅದಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ವಯಸ್ಸಾಗಿದೆಯೇ?';

  @override
  String get btn_yes => 'ಹೌದು';

  @override
  String get btn_no => 'ಇಲ್ಲ';

  @override
  String progress_indicator(int current, int total) {
    return 'ಪ್ರಶ್ನೆ $current / $total';
  }

  @override
  String pcos_type_hint(String type) {
    return 'ರೋಗಲಕ್ಷಣಗಳು $type ಪಾಲಿಸಿಸ್ಟಿಕ್ ಓವರಿ ಸಿಂಡ್ರೋಮ್ (PCOS) ಅನ್ನು ಸೂಚಿಸುತ್ತವೆ';
  }

  @override
  String get pcos_type_insulin_desc =>
      'ನಿಮ್ಮ ದೇಹವು ಇನ್ಸುಲಿನ್ ಅನ್ನು ಸರಿಯಾಗಿ ಬಳಸುತ್ತಿಲ್ಲದಿರಬಹುದು, ಇದು ತೂಕ ಹೆಚ್ಚಳಕ್ಕೆ ಕಾರಣವಾಗುತ್ತದೆ.';

  @override
  String get pcos_type_androgenic_desc =>
      'ಇದು ಪುರುಷ ಹಾರ್ಮೋನ್‌ಗಳ ಏರಿಕೆಯಿಂದಾಗಿ ಕೂದಲು ಮತ್ತು ಮೊಡವೆಗೆ ಕಾರಣವಾಗುತ್ತದೆ.';

  @override
  String get pcos_type_adrenal_desc =>
      'ಇದು ಒತ್ತಡದಿಂದಾಗಿ ಉಂಟಾಗುವ ಸಮಸ್ಯೆ ಆಗಿರಬಹುದು.';

  @override
  String get type_insulin_resistant => 'ಇನ್ಸುಲಿನ್-ನಿರೋಧಕ (Insulin-resistant)';

  @override
  String get type_androgenic => 'ಆಂಡ್ರೊಜೆನಿಕ್ (Androgenic)';

  @override
  String get type_adrenal => 'ಅಡ್ರಿನಲ್ (Adrenal)';

  @override
  String get btn_save_track => 'ರೋಗಲಕ್ಷಣಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get btn_generate_report => 'ವೈದ್ಯರ ವರದಿ ರಚಿಸಿ';

  @override
  String log_date_header(String date) {
    return 'ಇಂದು, $date';
  }

  @override
  String get log_symptoms_label => 'ಇಂದಿನ ರೋಗಲಕ್ಷಣಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get log_notes_label => 'ಇಂದಿನ ಟಿಪ್ಪಣಿಗಳು?';

  @override
  String get log_save_button => 'ಉಳಿಸಿ';

  @override
  String get log_saved_success => 'ಉಳಿಸಲಾಗಿದೆ ✓';

  @override
  String get log_already_logged => 'ಇಂದು ಈಗಾಗಲೇ ದಾಖಲಿಸಲಾಗಿದೆ';

  @override
  String get report_patient_name => 'ರೋಗಿಯ ಹೆಸರು';

  @override
  String get report_preview_title => 'ವರದಿ ಮುನ್ನೋಟ';

  @override
  String get report_share_btn => 'WhatsApp ನಲ್ಲಿ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get report_print_btn => 'ಪ್ರಿಂಟ್ ಮಾಡಿ';

  @override
  String get report_offline_note =>
      'ಈ ವರದಿಯನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿ ರಚಿಸಲಾಗಿದೆ.';

  @override
  String get home_hello => 'ನಮಸ್ಕಾರ';

  @override
  String get home_good_morning => 'ಶುಭೋದಯ';

  @override
  String get home_good_afternoon => 'ಶುಭ ಮಧ್ಯಾಹ್ನ';

  @override
  String get home_good_evening => 'ಶುಭ ಸಂಜೆ';

  @override
  String get home_time_today => 'ಇಂದು';

  @override
  String get home_time_yesterday => 'ನಿನ್ನೆ';

  @override
  String home_time_days_ago(int days) {
    return '$days ದಿನಗಳ ಹಿಂದೆ';
  }

  @override
  String get home_start_assessment => 'ಪರೀಕ್ಷೆ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get home_rerun_assessment => 'ಮತ್ತೆ ಪರೀಕ್ಷಿಸಿ';

  @override
  String get home_card_log => 'ರೋಗಲಕ್ಷಣ ದಾಖಲಿಸಿ';

  @override
  String get home_logged_done => 'ಮುಗಿದಿದೆ ✓';

  @override
  String get home_logged_today => 'ಇಂದು';

  @override
  String get home_card_report => 'ವರದಿ ಪಡೆಯಿರಿ';

  @override
  String get home_card_report_sub => 'ವೈದ್ಯರೊಂದಿಗೆ ಹಂಚಿಕೊಳ್ಳಿ';

  @override
  String get home_card_ai => 'Ovya ಕೇಳಿ';

  @override
  String get home_card_ai_ready => 'ಸಿದ್ಧವಾಗಿದೆ';

  @override
  String get home_card_ai_offline => 'ಆನ್‌ಲೈನ್ ಮಾತ್ರ';

  @override
  String get home_err_offline => 'ಈ ವೈಶಿಷ್ಟ್ಯಕ್ಕೆ ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕದ ಅಗತ್ಯವಿದೆ.';

  @override
  String get home_card_history => 'ನನ್ನ ಇತಿಹಾಸ';

  @override
  String get home_card_history_sub => 'ಹಳೆಯ ದಾಖಲೆಗಳು';

  @override
  String get home_empty_risk_title =>
      'ನಿಮ್ಮ ಪಾಲಿಸಿಸ್ಟಿಕ್ ಓವರಿ ಸಿಂಡ್ರೋಮ್ (PCOS) ಅಪಾಯದ ವರದಿ ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತದೆ';

  @override
  String get home_empty_risk_sub => 'ಕೇವಲ 2 ನಿಮಿಷ ಸಾಕು';

  @override
  String home_pcos_risk(String level) {
    return 'ಅಪಾಯ: $level';
  }

  @override
  String home_type_hint(String hint) {
    return '$hint ಪ್ರಕಾರ';
  }

  @override
  String home_last_assessed(String time) {
    return 'ಕೊನೆಯ ಪರೀಕ್ಷೆ: $time';
  }

  @override
  String get chat_title => 'Ask Ovya';

  @override
  String chat_context_card(String level) {
    return 'Based on your $level risk assessment...';
  }

  @override
  String get chat_offline_banner =>
      'Showing cached response — connect for live guidance';

  @override
  String get chat_disclaimer => 'This is AI guidance, not medical advice';

  @override
  String get chat_suggested_title => 'Suggested Questions';

  @override
  String get chat_suggestion_1 => 'What foods should I avoid with PCOS?';

  @override
  String get chat_suggestion_2 => 'How does stress affect PCOS?';

  @override
  String get chat_suggestion_3 => 'What should I ask my doctor?';

  @override
  String get chat_offline_tooltip => 'Connect to internet to ask Ovya';

  @override
  String get chat_input_hint => 'Ask about your PCOS...';

  @override
  String get pdfTitle => 'ಓವ್ಯಾ — PCOS ಆರೋಗ್ಯ ವರದಿ';

  @override
  String pdfDateGenerated(String date) {
    return 'ರಚಿಸಿದ ದಿನಾಂಕ: $date';
  }

  @override
  String get pdfDisclaimer =>
      'ಈ ವರದಿಯು ಕೇವಲ ಮಾಹಿತಿಗಾಗಿ. ದಯವಿಟ್ಟು ವೈದ್ಯರನ್ನು ಸಂಪರ್ಕಿಸಿ.';

  @override
  String get pdfGeneratedBy => 'ಓವ್ಯಾ ನಿಂದ ರಚಿಸಲಾಗಿದೆ — ಮಹಿಳಾ ಆರೋಗ್ಯ ಸಂಗಾತಿ';

  @override
  String get patientDetails => 'ರೋಗಿಯ ವಿವರಗಳು';

  @override
  String patientNameLabel(String name) {
    return 'ಹೆಸರು: $name';
  }

  @override
  String reportDateLabel(String date) {
    return 'ವರದಿ ದಿನಾಂಕ: $date';
  }

  @override
  String get riskAssessment => 'ಅಪಾಯದ ಮೌಲ್ಯಮಾಪನ';

  @override
  String get riskLevelLabel => 'ಅಪಾಯದ ಮಟ್ಟ:';

  @override
  String get scoreLabel => 'ಸ್ಕೋರ್:';

  @override
  String get pcosTypeHintLabel => 'PCOS ಪ್ರಕಾರದ ಸುಳಿವು:';

  @override
  String get explanationLabel => 'ವಿವರಣೆ:';

  @override
  String get symptomsLast30Days => 'ಕಳೆದ 30 ದಿನಗಳ ಲಕ್ಷಣಗಳು';

  @override
  String get noSymptoms30Days =>
      'ಕಳೆದ 30 ದಿನಗಳಲ್ಲಿ ಯಾವುದೇ ಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿಲ್ಲ.';

  @override
  String get tableHeaderDate => 'ದಿನಾಂಕ';

  @override
  String get tableHeaderSymptoms => 'ಲಕ್ಷಣಗಳು';

  @override
  String get tableHeaderMood => 'ಮೂಡ್/ಟಿಪ್ಪಣಿಗಳು';

  @override
  String get tableNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get low => 'ಕಡಿಮೆ';

  @override
  String get medium => 'ಮಧ್ಯಮ';

  @override
  String get high => 'ಹೆಚ್ಚು';

  @override
  String get hairThinning => 'ಕೂದಲು ತೆಳುವಾಗುವುದು';

  @override
  String get skinDarkening => 'ಚರ್ಮ ಕಪ್ಪಾಗುವುದು';

  @override
  String get fatigue => 'ಆಯಾಸ';

  @override
  String get sleepProblems => 'ನಿದ್ರೆಯ ಸಮಸ್ಯೆಗಳು';

  @override
  String get bloating => 'ಹೊಟ್ಟೆ ಉಬ್ಬರ';
}
