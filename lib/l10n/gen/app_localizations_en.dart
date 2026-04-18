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
  String get continueText => 'Continue';

  @override
  String get auth_sign_in => 'Sign In';

  @override
  String get auth_sign_up => 'Sign Up';

  @override
  String get auth_email => 'Email';

  @override
  String get auth_password => 'Password';

  @override
  String get auth_confirm_password => 'Confirm Password';

  @override
  String get auth_error_passwords_no_match => 'Passwords do not match';

  @override
  String get auth_create_account => 'Create Account';

  @override
  String get auth_loading => 'Loading...';

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
  String get syncingData => 'Syncing dataâ€¦';

  @override
  String get syncedSuccessfully => 'Synced successfully';

  @override
  String get fetchingInsights => 'Fetching new insightsâ€¦';

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

  @override
  String get rec_track_regularly =>
      'Continue tracking your symptoms regularly for early detection.';

  @override
  String get rec_balanced_diet =>
      'Maintain a balanced diet and consistent exercise routine.';

  @override
  String get rec_schedule_checkup =>
      'Consider scheduling a check-up with your healthcare provider.';

  @override
  String get rec_monitor_cycle =>
      'Monitor your menstrual cycle closely and note any irregularities.';

  @override
  String get rec_stress_management =>
      'Incorporate stress-management techniques like yoga or meditation.';

  @override
  String get rec_consult_gynecologist =>
      'Please consult a gynecologist or endocrinologist as soon as possible.';

  @override
  String get rec_request_bloodwork =>
      'Request blood work including hormone panel and insulin levels.';

  @override
  String get rec_symptom_diary =>
      'Keep a detailed symptom diary to share with your doctor.';

  @override
  String get q_irregular_cycle => 'Do you have irregular or missed periods?';

  @override
  String get q_hair_growth =>
      'Have you noticed unusual hair growth on your face or body?';

  @override
  String get q_family_history => 'Do you have a family member with PCOS?';

  @override
  String get q_weight_gain => 'Have you experienced unexplained weight gain?';

  @override
  String get q_acne => 'Do you have persistent acne?';

  @override
  String get q_skin_darkening => 'Have you noticed dark patches on your skin?';

  @override
  String get q_hair_thinning => 'Are you experiencing hair thinning or loss?';

  @override
  String get q_fatigue => 'Do you often feel fatigued or low on energy?';

  @override
  String get q_sleep_problems => 'Do you have difficulty sleeping?';

  @override
  String get q_bloating => 'Do you experience bloating regularly?';

  @override
  String get q_mood_issues => 'Do you experience frequent mood swings?';

  @override
  String get q_difficulty_conceiving => 'Are you having difficulty conceiving?';

  @override
  String get q_age_verification => 'Are you 18 years or older?';

  @override
  String get btn_yes => 'Yes';

  @override
  String get btn_no => 'No';

  @override
  String progress_indicator(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String pcos_type_hint(String type) {
    return 'Your symptoms suggest $type PCOS';
  }

  @override
  String get pcos_type_insulin_desc =>
      'This typically means your body has trouble using insulin effectively, leading to weight gain and irregular cycles.';

  @override
  String get pcos_type_androgenic_desc =>
      'This often involves higher levels of male hormones (androgens) causing excess hair and acne.';

  @override
  String get pcos_type_adrenal_desc =>
      'This is often triggered by an abnormal response to stress, primarily driven by adrenal androgens.';

  @override
  String get type_insulin_resistant => 'Insulin-resistant';

  @override
  String get type_androgenic => 'Androgenic';

  @override
  String get type_adrenal => 'Adrenal';

  @override
  String get btn_save_track => 'Save & Track Symptoms';

  @override
  String get btn_generate_report => 'Generate Doctor Report';

  @override
  String log_date_header(String date) {
    return 'Today, $date';
  }

  @override
  String get log_symptoms_label => 'Select your symptoms today';

  @override
  String get log_notes_label => 'Any notes for today?';

  @override
  String get log_save_button => 'Save Log';

  @override
  String get log_saved_success => 'Saved ✓';

  @override
  String get log_already_logged => 'Already logged today';

  @override
  String get report_patient_name => 'Patient Name';

  @override
  String get report_preview_title => 'Report Preview';

  @override
  String get report_share_btn => 'Share via WhatsApp / Apps';

  @override
  String get report_print_btn => 'Print';

  @override
  String get report_offline_note =>
      'This report is generated securely offline.';

  @override
  String get home_hello => 'Hello';

  @override
  String get home_good_morning => 'Good morning';

  @override
  String get home_good_afternoon => 'Good afternoon';

  @override
  String get home_good_evening => 'Good evening';

  @override
  String get home_time_today => 'Today';

  @override
  String get home_time_yesterday => 'Yesterday';

  @override
  String home_time_days_ago(int days) {
    return '$days days ago';
  }

  @override
  String get home_start_assessment => 'Start Health Assessment';

  @override
  String get home_rerun_assessment => 'Re-run Assessment';

  @override
  String get home_card_log => 'Log Symptoms';

  @override
  String get home_logged_done => 'Done ✓';

  @override
  String get home_logged_today => 'Today';

  @override
  String get home_card_report => 'Get Report';

  @override
  String get home_card_report_sub => 'Share with doctor';

  @override
  String get home_card_ai => 'Ask Ovya';

  @override
  String get home_card_ai_ready => 'Ready';

  @override
  String get home_card_ai_offline => 'Online only';

  @override
  String get home_err_offline =>
      'This feature requires an active internet connection.';

  @override
  String get home_card_history => 'My History';

  @override
  String get home_card_history_sub => 'View past logs';

  @override
  String get home_empty_risk_title =>
      'Your PCOS risk assessment will appear here';

  @override
  String get home_empty_risk_sub => 'Takes only 2 minutes';

  @override
  String home_pcos_risk(String level) {
    return 'PCOS Risk: $level';
  }

  @override
  String home_type_hint(String hint) {
    return '$hint type';
  }

  @override
  String home_last_assessed(String time) {
    return 'Last assessed: $time';
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
}
