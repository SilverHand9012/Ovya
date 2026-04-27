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
  String get greeting_morning => 'ಶುಭೋದಯ,';

  @override
  String get synced_just_now => 'ಎಲ್ಲಾ ಸೇವ್ ಆಗಿದೆ';

  @override
  String get syncing => 'ಸೇವ್ ಆಗುತ್ತಿದೆ...';

  @override
  String get elevated_risk => 'ಗಮನ ಕೊಡಿ';

  @override
  String get pcos_detected => 'ನಿಮ್ಮ ದೇಹ ಕೆಲವು ಸೂಚನೆಗಳನ್ನು ನೀಡುತ್ತಿದೆ';

  @override
  String get review_assessment => 'ಏನಾಗುತ್ತಿದೆ ಎಂದು ನೋಡಿ';

  @override
  String get todays_focus => 'ನಿಮ್ಮ ದಿನ';

  @override
  String get log_today => 'ಇಂದು ಹೇಗಿದ್ದೀರಾ?';

  @override
  String get doctor_report => 'ವೈದ್ಯರ ವರದಿ';

  @override
  String get ask_ovya => 'ಓವ್ಯಾ ಜೊತೆ ಮಾತನಾಡಿ';

  @override
  String get my_history => 'ನನ್ನ ಪಯಣ';

  @override
  String get mindful_moment => 'ನಿಮಗಾಗಿ ಒಂದು ಕ್ಷಣ';

  @override
  String get results_title => 'ನಿಮ್ಮ ಮಾಹಿತಿಗಳು';

  @override
  String get results_subtitle => 'ನಿಮ್ಮ ದೇಹ ಏನು ಹೇಳುತ್ತಿದೆ';

  @override
  String get high_risk => 'ಹೆಚ್ಚು';

  @override
  String get moderate_risk => 'ಮಧ್ಯಮ';

  @override
  String get low_risk => 'ಕಡಿಮೆ';

  @override
  String get what_this_means => 'ಇದರ ಅರ್ಥವೇನು';

  @override
  String get what_to_do_next => 'ಸಹಾಯ ಮಾಡುವ ಸಣ್ಣ ಹೆಜ್ಜೆಗಳು';

  @override
  String get generate_report => 'ವರದಿ ತಯಾರಿಸಿ';

  @override
  String get continue_tracking => 'ಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸುತ್ತಿರಿ';

  @override
  String your_body_today(String style_body) {
    return 'ಇಂದು ನಿಮ್ಮ $style_body';
  }

  @override
  String get energy_mood => 'ನಿಮ್ಮ ಎನರ್ಜಿ ಹೇಗಿದೆ?';

  @override
  String get symptoms_sensations => 'ನಿಮಗೆ ಹೇಗೆ ಅನಿಸುತ್ತಿದೆ?';

  @override
  String get journal_notes => 'ನಿಮ್ಮ ಟಿಪ್ಪಣಿಗಳು';

  @override
  String get journal_hint => 'ಇಂದು ಹೇಗೆ ಅನಿಸುತ್ತಿದೆ? ಏನಾದರೂ ವಿಶೇಷವಿದೆಯೇ...';

  @override
  String get take_a_breath =>
      'ನೀವು ತುಂಬಾ ಚೆನ್ನಾಗಿ ಮಾಡುತ್ತಿದ್ದೀರಿ. ಒಂದು ದೀರ್ಘ ಉಸಿರು ತೆಗೆದುಕೊಳ್ಳಿ.';

  @override
  String get save_log => 'ಸೇವ್ ಮಾಡಿ';

  @override
  String get symptom_headache => 'ತಲೆನೋವು';

  @override
  String get symptom_cramps => 'ಹೊಟ್ಟೆ ನೋವು';

  @override
  String get symptom_fatigue => 'ಆಯಾಸ';

  @override
  String get symptom_bloating => 'ಹೊಟ್ಟೆ ಉಬ್ಬರ';

  @override
  String get symptom_nausea => 'ವಾಕರಿಕೆ';

  @override
  String get symptom_backache => 'ಬೆನ್ನು ನೋವು';

  @override
  String get symptom_insomnia => 'ನಿದ್ರೆ ಬರುತ್ತಿಲ್ಲ';

  @override
  String get logout_dialog_title => 'ಇಷ್ಟು ಬೇಗ ಹೋಗುತ್ತಿದ್ದೀರಾ?';

  @override
  String logout_dialog_content(String pendingCount) {
    return 'ನಿಮ್ಮ $pendingCount ಮಾಹಿತಿಗಳು ಇನ್ನೂ ಸೇವ್ ಆಗಿಲ್ಲ. ಲಾಗ್ ಔಟ್ ಮಾಡಿದರೆ ಅವು ಕಳೆದುಹೋಗಬಹುದು.';
  }

  @override
  String get logout_dialog_confirm => 'ಹೊರಗೆ ಹೋಗಿ';

  @override
  String get logout_dialog_stay => 'ಉಳಿಯಿರಿ';

  @override
  String get sync_dialog_title => 'ಸೇವ್ ಮಾಡುವ ಸಮಯ';

  @override
  String sync_dialog_content(String pendingCount) {
    return 'ನಿಮ್ಮ $pendingCount ಮಾಹಿತಿಗಳು ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿವೆ. ಈಗ ಸೇವ್ ಮಾಡಬೇಕೇ?';
  }

  @override
  String get discard => 'ತೆಗೆದುಹಾಕಿ';

  @override
  String get later => 'ಆಮೇಲೆ';

  @override
  String get syncNow => 'ಈಗ ಸೇವ್ ಮಾಡಿ';

  @override
  String get auth_sign_in => 'ಸೈನ್ ಇನ್';

  @override
  String get auth_sign_up => 'ಅಕೌಂಟ್ ರಚಿಸಿ';

  @override
  String get auth_email => 'ಇಮೇಲ್';

  @override
  String get auth_password => 'ಪಾಸ್‌ವರ್ಡ್';

  @override
  String get auth_confirm_password => 'ಪಾಸ್‌ವರ್ಡ್ ಖಚಿತಪಡಿಸಿ';

  @override
  String get auth_error_passwords_no_match =>
      'ಪಾಸ್‌ವರ್ಡ್‌ಗಳು ಹೊಂದಾಣಿಕೆಯಾಗುತ್ತಿಲ್ಲ';

  @override
  String get auth_create_account => 'ಅಕೌಂಟ್ ರಚಿಸಿ';

  @override
  String get continueText => 'ಮುಂದುವರಿಯಿರಿ';

  @override
  String get chat_title => 'ಚಾಟ್';

  @override
  String chat_context_card(String level) {
    return 'ವಿಷಯ: $level';
  }

  @override
  String get chat_offline_banner => 'ನೀವು ಈಗ ಆಫ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದೀರಿ';

  @override
  String get chat_disclaimer => 'ಮಾಹಿತಿಗಾಗಿ ಮಾತ್ರ, ರೋಗನಿರ್ಣಯಕ್ಕಾಗಿ ಅಲ್ಲ';

  @override
  String get chat_suggested_title => 'ಕೇಳಿ ನೋಡಿ';

  @override
  String get chat_suggestion_1 => 'ಉತ್ತಮ ನಿದ್ರೆ ಮಾಡುವುದು ಹೇಗೆ?';

  @override
  String get chat_suggestion_2 => 'ಒತ್ತಡ ಕಡಿಮೆ ಮಾಡುವ ಮಾರ್ಗಗಳು';

  @override
  String get chat_suggestion_3 => 'ಇಂದು ಏನು ತಿನ್ನಬೇಕು?';

  @override
  String get chat_offline_tooltip => 'ಆಫ್‌ಲೈನ್';

  @override
  String get chat_input_hint => 'ಏನಾದರೂ ಟೈಪ್ ಮಾಡಿ...';

  @override
  String get btn_generate_report => 'ವರದಿ ತಯಾರಿಸಿ';

  @override
  String get report_offline_note =>
      'ನಿಮ್ಮ ವರದಿಯನ್ನು ನಿಮ್ಮ ಫೋನ್‌ನಲ್ಲಿಯೇ ತಯಾರಿಸಲಾಗಿದೆ. ಯಾವುದೂ ಹೊರಗೆ ಹೋಗಿಲ್ಲ.';

  @override
  String get report_patient_name => 'ನಿಮ್ಮ ಹೆಸರು';

  @override
  String get report_preview_title => 'ವರದಿಯಲ್ಲಿ ಏನಿದೆ';

  @override
  String get report_share_btn => 'ಶೇರ್ ಮಾಡಿ';

  @override
  String get report_print_btn => 'ಪ್ರಿಂಟ್ ಮಾಡಿ';

  @override
  String get pdfTitle => 'ಓವ್ಯಾ ಆರೋಗ್ಯ ವರದಿ';

  @override
  String pdfDateGenerated(String dateStr) {
    return '$dateStr ರಂದು ತಯಾರಿಸಲಾಗಿದೆ';
  }

  @override
  String get pdfDisclaimer =>
      'ಈ ವರದಿ ಮಾಹಿತಿಗಾಗಿ ಮಾತ್ರ, ವೈದ್ಯರ ಸಲಹೆಗೆ ಪರ್ಯಾಯವಲ್ಲ.';

  @override
  String get pdfGeneratedBy => 'ಓವ್ಯಾ ಇಂದ ತಯಾರಿಸಲಾಗಿದೆ';

  @override
  String get patientDetails => 'ನಿಮ್ಮ ಬಗ್ಗೆ';

  @override
  String patientNameLabel(String patientName) {
    return 'ಹೆಸರು: $patientName';
  }

  @override
  String reportDateLabel(String nowStr) {
    return 'ದಿನಾಂಕ: $nowStr';
  }

  @override
  String get riskAssessment => 'ರಿಸ್ಕ್ ಅವಲೋಕನ';

  @override
  String get riskLevelLabel => 'ರಿಸ್ಕ್ ಮಟ್ಟ';

  @override
  String get scoreLabel => 'ಸ್ಕೋರ್';

  @override
  String get pcosTypeHintLabel => 'PCOS ಮಾದರಿ';

  @override
  String pcos_type_hint(String hint) {
    return 'ಮಾದರಿ: $hint';
  }

  @override
  String get explanationLabel => 'ಇದರ ಅರ್ಥ';

  @override
  String get recommendations => 'ನೀವು ಏನು ಮಾಡಬಹುದು';

  @override
  String get symptomsLast30Days => 'ಕಳೆದ 30 ದಿನಗಳ ಲಕ್ಷಣಗಳು';

  @override
  String get noSymptoms30Days =>
      'ಕಳೆದ 30 ದಿನಗಳಲ್ಲಿ ಯಾವುದೇ ಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿಲ್ಲ';

  @override
  String get tableHeaderDate => 'ದಿನಾಂಕ';

  @override
  String get tableHeaderSymptoms => 'ಲಕ್ಷಣಗಳು';

  @override
  String get tableHeaderMood => 'ಮೂಡ್';

  @override
  String get irregularCycle => 'ಅನಿಯಮಿತ ಮುಟ್ಟು';

  @override
  String get acne => 'ಮೊಡವೆ';

  @override
  String get weightGain => 'ತೂಕ ಬದಲಾವಣೆ';

  @override
  String get excessHairGrowth => 'ಹೆಚ್ಚು ಕೂದಲು ಬೆಳೆಯುವುದು';

  @override
  String get moodIssues => 'ಮೂಡ್ ಸ್ವಿಂಗ್ಸ್';

  @override
  String get hairThinning => 'ಕೂದಲು ತೆಳುವಾಗುವುದು';

  @override
  String get skinDarkening => 'ಚರ್ಮ ಕಪ್ಪಾಗುವುದು';

  @override
  String get fatigue => 'ಆಯಾಸ';

  @override
  String get sleepProblems => 'ನಿದ್ರೆಯ ಸಮಸ್ಯೆ';

  @override
  String get bloating => 'ಹೊಟ್ಟೆ ಉಬ್ಬರ';

  @override
  String get tableNone => 'ಯಾವುದೂ ಇಲ್ಲ';

  @override
  String get rec_track_regularly => 'ಪ್ರತಿದಿನ ದಾಖಲಿಸುತ್ತಿರಿ';

  @override
  String get rec_balanced_diet => 'ಸಮತೋಲಿತ ಆಹಾರ ಸೇವಿಸಿ';

  @override
  String get rec_schedule_checkup => 'ಚೆಕ್-ಅಪ್ ಮಾಡಿಸಿಕೊಳ್ಳಿ';

  @override
  String get rec_monitor_cycle => 'ನಿಮ್ಮ ಮುಟ್ಟಿನ ಚಕ್ರವನ್ನು ಗಮನಿಸಿ';

  @override
  String get rec_stress_management =>
      'ಒತ್ತಡವನ್ನು ಕಡಿಮೆ ಮಾಡಲು ಮಾರ್ಗಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get rec_consult_gynecologist => 'ಸ್ತ್ರೀರೋಗತಜ್ಞರನ್ನು ಭೇಟಿ ಮಾಡಿ';

  @override
  String get rec_request_bloodwork => 'ರಕ್ತ ಪರೀಕ್ಷೆ ಮಾಡಿಸಿ';

  @override
  String get rec_symptom_diary => 'ಲಕ್ಷಣಗಳ ಡೈರಿಯನ್ನು ನಿರ್ವಹಿಸಿ';

  @override
  String get type_insulin_resistant => 'ಇನ್ಸುಲಿನ್ ರೆಸಿಸ್ಟೆಂಟ್';

  @override
  String get type_androgenic => 'ಆಂಡ್ರೊಜೆನಿಕ್';

  @override
  String get type_adrenal => 'ಅಡ್ರಿನಲ್';

  @override
  String get low => 'ಕಡಿಮೆ';

  @override
  String get medium => 'ಮಧ್ಯಮ';

  @override
  String get high => 'ಹೆಚ್ಚು';

  @override
  String get your_body_prefix => 'ಇಂದು ನಿಮ್ಮ ';

  @override
  String get your_body_word => 'ದೇಹ';

  @override
  String get your_body_suffix => '';

  @override
  String get mindful_ashwagandha_title => 'ಅಶ್ವಗಂಧ ಚಹಾ';

  @override
  String get mindful_ashwagandha_desc =>
      'ಮನಸ್ಸನ್ನು ಶಾಂತಗೊಳಿಸುತ್ತದೆ ಮತ್ತು ಹಾರ್ಮೋನ್‌ಗಳನ್ನು ಸಮತೋಲನಗೊಳಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.';

  @override
  String get chat_ask_ovya_title => 'ಓವ್ಯಾ ಜೊತೆ ಮಾತನಾಡಿ';

  @override
  String get chat_personal_guide => 'ನಿಮ್ಮ ವೆಲ್ನೆಸ್ ಸ್ನೇಹಿತೆ';

  @override
  String get chat_wellness_sanctuary => 'ನಿಮ್ಮ\nಸುರಕ್ಷಿತ\nಸ್ಥಳ';

  @override
  String get chat_wellness_subtitle =>
      'ನಿಮ್ಮ ಅಗತ್ಯಗಳಿಗೆ ತಕ್ಕಂತೆ ರೂಪಿಸಲಾದ ಮಾರ್ಗದರ್ಶನ.';

  @override
  String get chat_ovya_label => 'ಓವ್ಯಾ';

  @override
  String get chat_greeting =>
      'ಹಲೋ! ಈ ವಾರ ನಿಮ್ಮ ನಿದ್ರೆ ಸ್ವಲ್ಪ ಅನಿಯಮಿತವಾಗಿದೆ ಎಂದು ಕಾಣುತ್ತಿದೆ. ನಿಮಗೆ ಉತ್ತಮವಾಗಿ ವಿಶ್ರಾಂತಿ ಪಡೆಯಲು ಕೆಲವು ಸಲಹೆಗಳು ಬೇಕೇ?';

  @override
  String get chat_thinking => 'ಯೋಚಿಸುತ್ತಿದ್ದೇನೆ...';

  @override
  String get chat_chip_sleep => 'ನಿದ್ರೆ';

  @override
  String get chat_chip_stress => 'ಒತ್ತಡ';

  @override
  String get chat_chip_hormonal => 'ಹಾರ್ಮೋನ್‌ಗಳು';

  @override
  String get chat_chip_diet => 'ಆಹಾರ';

  @override
  String get chat_input_placeholder => 'ನಿಮಗೆ ಹೇಗೆ ಅನಿಸುತ್ತಿದೆ ಎಂದು ಹೇಳಿ...';

  @override
  String get chat_companion_note => 'ಓವ್ಯಾ ನಿಮ್ಮ ಸ್ನೇಹಿತೆ, ವೈದ್ಯರಲ್ಲ.';

  @override
  String get chat_suggest_sleep => 'ಉತ್ತಮ ನಿದ್ರೆ ಮಾಡುವುದು ಹೇಗೆ?';

  @override
  String get chat_suggest_stress =>
      'PCOS ನೊಂದಿಗೆ ಒತ್ತಡವನ್ನು ಹೇಗೆ ನಿರ್ವಹಿಸುವುದು?';

  @override
  String get chat_suggest_hormonal => 'ಹಾರ್ಮೋನ್‌ಗಳನ್ನು ಸಮತೋಲನಗೊಳಿಸುವುದು ಹೇಗೆ?';

  @override
  String get chat_suggest_diet => 'PCOS ಗಾಗಿ ಏನು ತಿನ್ನಬೇಕು?';

  @override
  String get report_preview_demographics => 'ನಿಮ್ಮ ವಿವರಗಳು ಮತ್ತು ವರದಿ ದಿನಾಂಕ';

  @override
  String get report_preview_risk => 'ರಿಸ್ಕ್ ಸ್ಕೋರ್ ಮತ್ತು PCOS ಮಾದರಿ';

  @override
  String get report_preview_logs => '30 ದಿನಗಳ ಲಕ್ಷಣಗಳ ಸಾರಾಂಶ';

  @override
  String get report_preview_recs => 'ನಿಮಗಾಗಿ ಸಲಹೆಗಳು';

  @override
  String get report_enter_name => 'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಹೆಸರನ್ನು ನಮೂದಿಸಿ';

  @override
  String get log_saved => 'ಸೇವ್ ಆಗಿದೆ! ನೀವು ಉತ್ತಮವಾಗಿ ಮಾಡುತ್ತಿದ್ದೀರಿ ✓';

  @override
  String get no_risk_data =>
      'ಇನ್ನೂ ಡೇಟಾ ಇಲ್ಲ. ಒಳನೋಟಗಳನ್ನು ನೋಡಲು ಮೊದಲು ನಿಮ್ಮ ಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿ.';

  @override
  String get history_title => 'ನನ್ನ ಪಯಣ';

  @override
  String get history_recent_assessments => 'ಇತ್ತೀಚಿನ ತಪಾಸಣೆಗಳು';

  @override
  String get history_daily_logs => 'ದೈನಂದಿನ ಲಾಗ್‌ಗಳು';

  @override
  String get history_no_assessments =>
      'ಇನ್ನೂ ಯಾವುದೇ ತಪಾಸಣೆಗಳಿಲ್ಲ. ದಾಖಲಿಸಲು ಪ್ರಾರಂಭಿಸಿ!';

  @override
  String get history_no_logs => 'ಇನ್ನೂ ಏನೂ ಇಲ್ಲ. ಟ್ರ್ಯಾಕ್ ಮಾಡಲು ಪ್ರಾರಂಭಿಸಿ.';

  @override
  String get history_general_profile => 'ಸಾಮಾನ್ಯ ಪ್ರೊಫೈಲ್';

  @override
  String get history_no_symptoms_tag => 'ಯಾವುದೇ ಲಕ್ಷಣಗಳನ್ನು ದಾಖಲಿಸಿಲ್ಲ';

  @override
  String get analysis_complete => 'ನಿಮ್ಮ ಫಲಿತಾಂಶಗಳು ಸಿದ್ಧವಾಗಿವೆ';

  @override
  String get insulin_resistant_pcos_indicator => 'ಇನ್ಸುಲಿನ್ ರೆಸಿಸ್ಟೆಂಟ್ ಮಾದರಿ';

  @override
  String get androgenic_pcos_indicator => 'ಆಂಡ್ರೊಜೆನಿಕ್ ಮಾದರಿ';

  @override
  String get adrenal_pcos_indicator => 'ಅಡ್ರಿನಲ್ ಮಾದರಿ';

  @override
  String get general_pcos_indicator => 'ಸಾಮಾನ್ಯ ಮಾದರಿ';

  @override
  String get hormonal_imbalance_detected =>
      'ಕೆಲವು ಹಾರ್ಮೋನ್ ಬದಲಾವಣೆಗಳನ್ನು ನಾವು ಗಮನಿಸಿದ್ದೇವೆ';

  @override
  String get risk_explanation_high =>
      'ನೀವು ಹಂಚಿಕೊಂಡ ಮಾಹಿತಿಯ ಆಧಾರದ ಮೇಲೆ — ಆಯಾಸ, ಅನಿಯಮಿತ ಮುಟ್ಟು, ಮತ್ತು ಇತರ ಲಕ್ಷಣಗಳು — ನಿಮ್ಮ ದೇಹವು ಕೆಲವು ಹಾರ್ಮೋನ್ ಬದಲಾವಣೆಗಳನ್ನು ಅನುಭವಿಸುತ್ತಿರಬಹುದು. ಚಿಂತಿಸಬೇಡಿ, ಇದು ತುಂಬಾ ಸಾಮಾನ್ಯ.';

  @override
  String get risk_explanation_medium =>
      'ನಿಮ್ಮ ಕೆಲವು ಲಕ್ಷಣಗಳು ಗಮನಹರಿಸಬೇಕಾದ ಮಾದರಿಗಳನ್ನು ತೋರಿಸುತ್ತಿವೆ. ನಿಯಮಿತವಾಗಿ ಟ್ರ್ಯಾಕ್ ಮಾಡುವುದು ನಮಗೆ ಉತ್ತಮವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.';

  @override
  String get risk_explanation_low =>
      'ಎಲ್ಲವೂ ಸರಿಯಾಗಿರುವಂತೆ ತೋರುತ್ತಿದೆ! ಟ್ರ್ಯಾಕ್ ಮಾಡುತ್ತಿರಿ ಇದರಿಂದ ಯಾವುದೇ ಬದಲಾವಣೆಗಳನ್ನು ನಾವು ಬೇಗನೆ ಗುರುತಿಸಬಹುದು.';

  @override
  String get insight_explanation_insulin =>
      'ನಿಮ್ಮ ದೇಹಕ್ಕೆ ಸಕ್ಕರೆಯನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲು ಸ್ವಲ್ಪ ಕಷ್ಟವಾಗುತ್ತಿರಬಹುದು, ಇದರಿಂದ ಹಗಲಿನಲ್ಲಿ ಶಕ್ತಿ ಕಡಿಮೆಯಾಗುವುದು ಮತ್ತು ಮೂಡ್ ಬದಲಾಗುವುದು ಉಂಟಾಗಬಹುದು. ಇದು ತುಂಬಾ ಸಾಮಾನ್ಯವಾಗಿದೆ ಮತ್ತು ಸಣ್ಣ ಬದಲಾವಣೆಗಳೊಂದಿಗೆ ನಿರ್ವಹಿಸಬಹುದು.';

  @override
  String get insight_explanation_androgenic =>
      'ಲಕ್ಷಣಗಳನ್ನು ನೋಡಿದರೆ ಆಂಡ್ರೊಜೆನ್ ಹಾರ್ಮೋನ್ ಸ್ವಲ್ಪ ಹೆಚ್ಚಾಗಿದೆ ಎಂದು ತೋರುತ್ತದೆ, ಇದರ ಪರಿಣಾಮ ಚರ್ಮ ಮತ್ತು ಕೂದಲಿನ ಮೇಲೆ ಕಾಣಿಸಬಹುದು. ಇದು PCOS ನ ಅತ್ಯಂತ ಸಾಮಾನ್ಯ ವಿಧವಾಗಿದೆ ಮತ್ತು ಸರಿಯಾದ ಆರೈಕೆಯಿಂದ ಸುಧಾರಿಸುತ್ತದೆ.';

  @override
  String get insight_explanation_adrenal =>
      'ಒತ್ತಡವು ನಿಮ್ಮ ಹಾರ್ಮೋನ್‌ಗಳ ಮೇಲೆ ಪರಿಣಾಮ ಬೀರುತ್ತಿದೆ ಎಂದು ತೋರುತ್ತಿದೆ. ಒಳ್ಳೆಯ ಸುದ್ದಿ ಎಂದರೆ, ವಿಶ್ರಾಂತಿ, ಉತ್ತಮ ನಿದ್ರೆ ಮತ್ತು ಒತ್ತಡವನ್ನು ಕಡಿಮೆ ಮಾಡುವುದರಿಂದ ಈ ವಿಧದಲ್ಲಿ ಬಹಳಷ್ಟು ಸುಧಾರಣೆ ಕಾಣಬಹುದು.';

  @override
  String get insight_explanation_general =>
      'ನಿಮ್ಮ ಲಕ್ಷಣಗಳು ಕೆಲವು ಸಾಮಾನ್ಯ PCOS ಮಾದರಿಗಳನ್ನು ತೋರಿಸುತ್ತಿವೆ. ನಿಯಮಿತ ಟ್ರ್ಯಾಕಿಂಗ್ ಮತ್ತು ಸರಿಯಾದ ಮಾರ್ಗದರ್ಶನದೊಂದಿಗೆ, ಇವುಗಳನ್ನು ಸುಲಭವಾಗಿ ನಿರ್ವಹಿಸಬಹುದು.';

  @override
  String get action_balanced_meals_title => 'ಪೌಷ್ಟಿಕ ಮತ್ತು ಸಮತೋಲಿತ ಆಹಾರ ಸೇವಿಸಿ';

  @override
  String get action_balanced_meals_subtitle =>
      'ಪ್ರತಿ ಊಟದಲ್ಲಿ ಪ್ರೋಟೀನ್, ಫೈಬರ್ ಮತ್ತು ಆರೋಗ್ಯಕರ ಕೊಬ್ಬುಗಳನ್ನು ಸೇರಿಸಿ.';

  @override
  String get action_light_movement_title => 'ಪ್ರತಿದಿನ ಸ್ವಲ್ಪ ನಡೆಯಿರಿ';

  @override
  String get action_light_movement_subtitle =>
      'ಊಟದ ನಂತರ 15 ನಿಮಿಷಗಳ ನಡಿಗೆ ಇನ್ಸುಲಿನ್ ನಿಯಂತ್ರಿಸಲು ಸಹಾಯ ಮಾಡುತ್ತದೆ.';

  @override
  String get action_sleep_title => 'ನಿಮ್ಮ ದೇಹಕ್ಕೆ ಸರಿಯಾದ ವಿಶ್ರಾಂತಿ ನೀಡಿ';

  @override
  String get action_sleep_subtitle =>
      '7-8 ಗಂಟೆಗಳ ಕಾಲ ನಿದ್ರಿಸಿ — ನಿಮ್ಮ ಹಾರ್ಮೋನ್‌ಗಳಿಗೆ ಇದು ಅಗತ್ಯವಿದೆ.';

  @override
  String get action_skin_care_title => 'ಚರ್ಮದ ಕಾಳಜಿ ವಹಿಸಿ';

  @override
  String get action_skin_care_subtitle =>
      'ಸೌಮ್ಯವಾದ ಕ್ಲೆನ್ಸರ್‌ಗಳು ಮತ್ತು ಸರಿಯಾದ ಚಿಕಿತ್ಸೆಗಳು ಬಹಳಷ್ಟು ಸಹಾಯ ಮಾಡುತ್ತವೆ.';

  @override
  String get action_anti_inflammatory_title =>
      'ಉರಿಯೂತ ನಿವಾರಕ ಆಹಾರಗಳನ್ನು ಸೇರಿಸಿ';

  @override
  String get action_anti_inflammatory_subtitle =>
      'ಅರಿಶಿನ, ಒಮೆಗಾ-3 ಮತ್ತು ಸೊಪ್ಪುಗಳು — ಇವು ನಿಮ್ಮ ಸ್ನೇಹಿತರು.';

  @override
  String get action_consult_title => 'ತಜ್ಞರನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get action_consult_subtitle =>
      'ಎಂಡೋಕ್ರೈನಾಲಜಿಸ್ಟ್ ಹಾರ್ಮೋನ್ ಮಟ್ಟವನ್ನು ಪರೀಕ್ಷಿಸಬಹುದು.';

  @override
  String get action_stress_title => 'ನಿಮ್ಮ ಶಾಂತಿಯನ್ನು ಹುಡುಕಿ';

  @override
  String get action_stress_subtitle =>
      'ಯೋಗ, ಧ್ಯಾನ ಅಥವಾ ಸ್ವಲ್ಪ ದೀರ್ಘ ಉಸಿರಾಟವನ್ನು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get action_cortisol_title => 'ಕಾರ್ಟಿಸೋಲ್ ಸಮತೋಲನದಲ್ಲಿಡಿ';

  @override
  String get action_cortisol_subtitle =>
      'ಕಡಿಮೆ ಕೆಫೀನ್, ಉತ್ತಮ ನಿದ್ರೆ. ಸಣ್ಣ ಬದಲಾವಣೆಗಳು, ದೊಡ್ಡ ಪರಿಣಾಮ.';

  @override
  String get action_adaptogens_title =>
      'ನೈಸರ್ಗಿಕ ಅಡಾಪ್ಟೋಜೆನ್‌ಗಳನ್ನು ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get action_adaptogens_subtitle =>
      'ಅಶ್ವಗಂಧ ಮತ್ತು ತುಳಸಿ ಒತ್ತಡವನ್ನು ನಿರ್ವಹಿಸಲು ಸಹಾಯ ಮಾಡಬಹುದು.';

  @override
  String get wellness_tip_intro =>
      'ಬೆಚ್ಚಗಿನ ಗಿಡಮೂಲಿಕೆ ಚಹಾದೊಂದಿಗೆ ನಿಮ್ಮ ಬೆಳಿಗ್ಗೆಯನ್ನು ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get wellness_tip_body =>
      '— ಇದು ಹೊಟ್ಟೆ ಉಬ್ಬರವನ್ನು ಕಡಿಮೆ ಮಾಡುತ್ತದೆ ಮತ್ತು ನಿಮ್ಮ ಹೊಟ್ಟೆಯನ್ನು ಶಾಂತಗೊಳಿಸುತ್ತದೆ.';

  @override
  String get ask_ovya_anything => 'ಓವ್ಯಾ ಬಳಿ ಏನನ್ನಾದರೂ ಕೇಳಿ';

  @override
  String get report_generated_success => 'ನಿಮ್ಮ ವರದಿ ಸಿದ್ಧವಾಗಿದೆ!';

  @override
  String get q_irregular_cycle => 'ನಿಮಗೆ ಅನಿಯಮಿತ ಋತುಚಕ್ರವಿದೆಯೇ?';

  @override
  String get q_hair_growth =>
      'ನಿಮ್ಮ ಮುಖ ಅಥವಾ ದೇಹದ ಮೇಲೆ ಅನಗತ್ಯ ಕೂದಲು ಬೆಳೆಯುತ್ತಿದೆಯೇ?';

  @override
  String get q_family_history =>
      'ನಿಮ್ಮ ಕುಟುಂಬದಲ್ಲಿ ಯಾರಿಗಾದರೂ PCOS ಸಮಸ್ಯೆ ಇದೆಯೇ?';

  @override
  String get q_weight_gain => 'ಕಾರಣವಿಲ್ಲದೆ ನಿಮ್ಮ ತೂಕ ಹೆಚ್ಚಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_acne => 'ನಿಮಗೆ ತೀವ್ರವಾದ ಮೊಡವೆಗಳ ಸಮಸ್ಯೆಯಿದೆಯೇ?';

  @override
  String get q_skin_darkening =>
      'ನಿಮ್ಮ ಚರ್ಮವು (ಉದಾಹರಣೆಗೆ ಕುತ್ತಿಗೆಯ ಸುತ್ತ) ಕಪ್ಪಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_hair_thinning =>
      'ನಿಮ್ಮ ಕೂದಲು ಉದುರುತ್ತಿದೆಯೇ ಅಥವಾ ತೆಳುವಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_fatigue => 'ನಿಮಗೆ ಆಗಾಗ್ಗೆ ಅತಿಯಾದ ಆಯಾಸವಾಗುತ್ತದೆಯೇ?';

  @override
  String get q_sleep_problems => 'ನಿಮಗೆ ನಿದ್ರಿಸಲು ತೊಂದರೆಯಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_bloating => 'ನಿಮಗೆ ಆಗಾಗ್ಗೆ ಹೊಟ್ಟೆ ಉಬ್ಬರವಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_mood_issues =>
      'ನಿಮಗೆ ಆಗಾಗ್ಗೆ ಮೂಡ್ ಸ್ವಿಂಗ್ (ಮನಸ್ಥಿತಿ ಬದಲಾವಣೆ) ಆಗುತ್ತಿದೆಯೇ?';

  @override
  String get q_over_18 => 'ನಿಮಗೆ 18 ವರ್ಷಕ್ಕಿಂತ ಮೇಲ್ಪಟ್ಟ ವಯಸ್ಸಾಗಿದೆಯೇ?';

  @override
  String get q_difficulty_conceiving => 'ನಿಮಗೆ ಗರ್ಭಧರಿಸಲು ತೊಂದರೆಯಾಗುತ್ತಿದೆಯೇ?';

  @override
  String get trackCycle => 'ಸೈಕಲ್ ಟ್ರ್ಯಾಕ್ ಮಾಡಿ';

  @override
  String get logPeriodDates => 'ನಿಮ್ಮ ಮುಟ್ಟಿನ ದಿನಾಂಕಗಳನ್ನು ಲಾಗ್ ಮಾಡಿ';

  @override
  String get auth_welcome_title => 'ಓವ್ಯಾಗೆ ಸ್ವಾಗತ';

  @override
  String get auth_welcome_subtitle =>
      'ನಿಮ್ಮ ಆರೋಗ್ಯವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಮತ್ತು ನಿರ್ವಹಿಸಲು ನಿಮ್ಮ ಒಡನಾಡಿ';

  @override
  String get auth_login_signup_btn => 'ಲಾಗಿನ್ / ಸೈನ್ ಅಪ್';

  @override
  String get auth_guest_btn => 'ಅತಿಥಿಯಾಗಿ ಮುಂದುವರಿಯಿರಿ';

  @override
  String get auth_private_secure => 'ನಿಮ್ಮ ಡೇಟಾ ಖಾಸಗಿ ಮತ್ತು ಸುರಕ್ಷಿತವಾಗಿರಲಿದೆ';

  @override
  String get auth_gently_guided => 'ನಿಮ್ಮ ಆರೋಗ್ಯ, ಮೃದುವಾಗಿ ಮಾರ್ಗದರ್ಶನ';

  @override
  String get auth_email_hint => 'you@example.com';

  @override
  String get auth_password_hint => '........';

  @override
  String get auth_forgot_password => 'ಪಾಸ್‌ವರ್ಡ್ ಮರೆತಿರಾ?';

  @override
  String get auth_or => 'ಅಥವಾ';

  @override
  String get auth_continue_google => 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಯಿರಿ';

  @override
  String get auth_dont_have_account => 'ಖಾತೆ ಇಲ್ಲವೇ? ';

  @override
  String get auth_full_name => 'ಪೂರ್ಣ ಹೆಸರು';

  @override
  String get auth_name_hint => 'Jane Doe';

  @override
  String get auth_email_address => 'ಇಮೇಲ್ ವಿಳಾಸ';

  @override
  String get auth_already_have_account => 'ಈಗಾಗಲೇ ಖಾತೆಯನ್ನು ಹೊಂದಿದ್ದೀರಾ? ';

  @override
  String get welcome_title => 'Ovya ಗೆ ಸುಸ್ವಾಗತ';

  @override
  String get welcome_subtitle => 'ನಿಮ್ಮ ಆರೋಗ್ಯವನ್ನು ಉತ್ತಮವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳೋಣ';

  @override
  String get welcome_desc =>
      'ವೈಯಕ್ತಿಕಗೊಳಿಸಿದ ಒಳನೋಟಗಳನ್ನು ಪಡೆಯಲು ಕೆಲವು ಸರಳ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ';

  @override
  String get welcome_name_hint => 'ನಾವು ನಿಮ್ಮನ್ನು ಏನಂದು ಕರೆಯಬೇಕು?';

  @override
  String get welcome_name_label => 'ನಿಮ್ಮ ಹೆಸರು';

  @override
  String get welcome_start_btn => 'ಮೌಲ್ಯಮಾಪನ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get assessment_title => 'ಮೌಲ್ಯಮಾಪನ';

  @override
  String get assessment_help_text =>
      'ನಿಮ್ಮ ಸ್ಥಳವನ್ನು ವೈಯಕ್ತೀಕರಿಸಲು ಇದು ನಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ.';

  @override
  String get btn_yes => 'ಹೌದು';

  @override
  String get btn_no => 'ಇಲ್ಲ';

  @override
  String get btn_next => 'ಮುಂದೆ';

  @override
  String get all_set_title => 'ಎಲ್ಲವೂ ಸಿದ್ಧವಾಗಿದೆ';

  @override
  String get all_set_subtitle =>
      'ನಿಮ್ಮ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get all_set_btn => 'ಫಲಿತಾಂಶಗಳನ್ನು ನೋಡಿ';

  @override
  String get all_set_footer =>
      'ನಿಮ್ಮ ಡೇಟಾ ನಿಮ್ಮ ಅಭಯಾರಣ್ಯದಲ್ಲಿ (sanctuary) ಸುರಕ್ಷಿತವಾಗಿದೆ.';

  @override
  String question_progress(String current, String total) {
    return 'ಪ್ರಶ್ನೆ $current / $total';
  }

  @override
  String get cycle_tracking_title => 'ಋತುಚಕ್ರದ ಟ್ರ್ಯಾಕಿಂಗ್';

  @override
  String get log_new_cycle => 'ಹೊಸ ಸೈಕಲ್ ದಾಖಲಿಸಿ';

  @override
  String get select_start_date => 'ಪ್ರಾರಂಭದ ದಿನಾಂಕವನ್ನು ಆರಿಸಿ';

  @override
  String get save_entry => 'ದಾಖಲೆಯನ್ನು ಉಳಿಸಿ';

  @override
  String get recent_cycles => 'ಇತ್ತೀಚಿನ ಸೈಕಲ್‌ಗಳು';

  @override
  String get no_cycle_entries => 'ಇನ್ನೂ ಯಾವುದೇ ಸೈಕಲ್ ದಾಖಲೆಗಳಿಲ್ಲ.';

  @override
  String get period_started => 'ಋತುಸ್ರಾವ ಪ್ರಾರಂಭವಾಯಿತು';

  @override
  String get cycle_date_saved => 'ಸೈಕಲ್ ದಿನಾಂಕವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಉಳಿಸಲಾಗಿದೆ!';

  @override
  String get report_title => 'ಓವ್ಯಾ ಆರೋಗ್ಯ ವರದಿ';

  @override
  String get cycle => 'ಋತುಚಕ್ರ';

  @override
  String get insights => 'ಒಳನೋಟಗಳು';

  @override
  String report_summary(String symptoms, String riskLevel) {
    return 'ನಿಮ್ಮ ಲಕ್ಷಣಗಳ ($symptoms) ಆಧಾರದ ಮೇಲೆ, ನಿಮ್ಮ ಅಂದಾಜು PCOS ಅಪಾಯದ ಮಟ್ಟವು $riskLevel ಆಗಿದೆ.';
  }

  @override
  String get cycle_history => 'ಋತುಚಕ್ರದ ಇತಿಹಾಸ';
}
