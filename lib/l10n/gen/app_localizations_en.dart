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
  String get greeting_morning => 'Good morning,';

  @override
  String get synced_just_now => 'ALL SYNCED';

  @override
  String get syncing => 'SYNCING...';

  @override
  String get elevated_risk => 'NEEDS ATTENTION';

  @override
  String get pcos_detected => 'Your body is showing signs';

  @override
  String get review_assessment => 'See what\'s going on';

  @override
  String get todays_focus => 'Your Day';

  @override
  String get log_today => 'How are you today?';

  @override
  String get doctor_report => 'Doctor report';

  @override
  String get ask_ovya => 'Talk to Ovya';

  @override
  String get my_history => 'My Journey';

  @override
  String get mindful_moment => 'A Moment for You';

  @override
  String get results_title => 'Your Insights';

  @override
  String get results_subtitle => 'Here\'s what your body is telling us';

  @override
  String get high_risk => 'HIGH';

  @override
  String get moderate_risk => 'MODERATE';

  @override
  String get low_risk => 'LOW';

  @override
  String get what_this_means => 'What this means for you';

  @override
  String get what_to_do_next => 'SMALL STEPS THAT HELP';

  @override
  String get generate_report => 'Create a detailed report';

  @override
  String get continue_tracking => 'Keep tracking your symptoms';

  @override
  String your_body_today(String style_body) {
    return 'Your $style_body today';
  }

  @override
  String get energy_mood => 'How\'s your energy?';

  @override
  String get symptoms_sensations => 'What are you feeling?';

  @override
  String get journal_notes => 'YOUR NOTES';

  @override
  String get journal_hint =>
      'How are you feeling today? Anything on your mind...';

  @override
  String get take_a_breath => 'You\'re doing great. Take a breath.';

  @override
  String get save_log => 'Save';

  @override
  String get symptom_headache => 'Headache';

  @override
  String get symptom_cramps => 'Cramps';

  @override
  String get symptom_fatigue => 'Tired';

  @override
  String get symptom_bloating => 'Bloating';

  @override
  String get symptom_nausea => 'Nausea';

  @override
  String get symptom_backache => 'Back pain';

  @override
  String get symptom_insomnia => 'Can\'t sleep';

  @override
  String get logout_dialog_title => 'Leaving so soon?';

  @override
  String logout_dialog_content(String pendingCount) {
    return 'You have $pendingCount entries that haven\'t synced yet. They might be lost if you log out now.';
  }

  @override
  String get logout_dialog_confirm => 'Log out anyway';

  @override
  String get logout_dialog_stay => 'Stay';

  @override
  String get sync_dialog_title => 'Time to sync';

  @override
  String sync_dialog_content(String pendingCount) {
    return 'You have $pendingCount entries saved offline. Want to sync them now?';
  }

  @override
  String get discard => 'Discard';

  @override
  String get later => 'Later';

  @override
  String get syncNow => 'Sync now';

  @override
  String get auth_sign_in => 'Sign In';

  @override
  String get auth_sign_up => 'Sign Up';

  @override
  String get auth_email => 'Email';

  @override
  String get auth_password => 'Password';

  @override
  String get auth_confirm_password => 'Confirm password';

  @override
  String get auth_error_passwords_no_match => 'Passwords don\'t match';

  @override
  String get auth_create_account => 'Create Account';

  @override
  String get continueText => 'Continue';

  @override
  String get chat_title => 'Chat';

  @override
  String chat_context_card(String level) {
    return 'Context: $level';
  }

  @override
  String get chat_offline_banner => 'You\'re offline right now';

  @override
  String get chat_disclaimer => 'For awareness, not diagnosis';

  @override
  String get chat_suggested_title => 'Try asking';

  @override
  String get chat_suggestion_1 => 'How can I sleep better?';

  @override
  String get chat_suggestion_2 => 'Tips for managing stress';

  @override
  String get chat_suggestion_3 => 'What should I eat today?';

  @override
  String get chat_offline_tooltip => 'Offline';

  @override
  String get chat_input_hint => 'Type something...';

  @override
  String get btn_generate_report => 'Generate Report';

  @override
  String get report_offline_note =>
      'Your report is created locally. Nothing leaves your phone.';

  @override
  String get report_patient_name => 'Your name';

  @override
  String get report_preview_title => 'What\'s in the report';

  @override
  String get report_share_btn => 'Share';

  @override
  String get report_print_btn => 'Print';

  @override
  String get pdfTitle => 'Ovya Health Report';

  @override
  String pdfDateGenerated(String dateStr) {
    return 'Created on $dateStr';
  }

  @override
  String get pdfDisclaimer =>
      'This report is for informational purposes only and does not replace medical advice.';

  @override
  String get pdfGeneratedBy => 'Generated by Ovya';

  @override
  String get patientDetails => 'About You';

  @override
  String patientNameLabel(String patientName) {
    return 'Name: $patientName';
  }

  @override
  String reportDateLabel(String nowStr) {
    return 'Date: $nowStr';
  }

  @override
  String get riskAssessment => 'Risk Overview';

  @override
  String get riskLevelLabel => 'Risk Level';

  @override
  String get scoreLabel => 'Score';

  @override
  String get pcosTypeHintLabel => 'PCOS Pattern';

  @override
  String pcos_type_hint(String hint) {
    return 'Pattern: $hint';
  }

  @override
  String get explanationLabel => 'What it means';

  @override
  String get recommendations => 'What you can do';

  @override
  String get symptomsLast30Days => 'Your symptoms — last 30 days';

  @override
  String get noSymptoms30Days => 'No symptoms logged in the last 30 days';

  @override
  String get tableHeaderDate => 'Date';

  @override
  String get tableHeaderSymptoms => 'Symptoms';

  @override
  String get tableHeaderMood => 'Mood';

  @override
  String get irregularCycle => 'Irregular periods';

  @override
  String get acne => 'Acne';

  @override
  String get weightGain => 'Weight changes';

  @override
  String get excessHairGrowth => 'Excess hair growth';

  @override
  String get moodIssues => 'Mood swings';

  @override
  String get hairThinning => 'Hair thinning';

  @override
  String get skinDarkening => 'Skin darkening';

  @override
  String get fatigue => 'Fatigue';

  @override
  String get sleepProblems => 'Sleep trouble';

  @override
  String get bloating => 'Bloating';

  @override
  String get tableNone => 'None';

  @override
  String get rec_track_regularly => 'Keep tracking regularly';

  @override
  String get rec_balanced_diet => 'Eat balanced meals';

  @override
  String get rec_schedule_checkup => 'Schedule a check-up';

  @override
  String get rec_monitor_cycle => 'Keep an eye on your cycle';

  @override
  String get rec_stress_management => 'Find ways to de-stress';

  @override
  String get rec_consult_gynecologist => 'Talk to a gynaecologist';

  @override
  String get rec_request_bloodwork => 'Consider a blood test';

  @override
  String get rec_symptom_diary => 'Maintain a symptom diary';

  @override
  String get type_insulin_resistant => 'Insulin Resistant';

  @override
  String get type_androgenic => 'Androgenic';

  @override
  String get type_adrenal => 'Adrenal';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get your_body_prefix => 'Your ';

  @override
  String get your_body_word => 'body';

  @override
  String get your_body_suffix => ' today';

  @override
  String get mindful_ashwagandha_title => 'Ashwagandha Tea';

  @override
  String get mindful_ashwagandha_desc =>
      'Helps calm your mind and bring your hormones into balance.';

  @override
  String get chat_ask_ovya_title => 'Talk to Ovya';

  @override
  String get chat_personal_guide => 'YOUR WELLNESS BUDDY';

  @override
  String get chat_wellness_sanctuary => 'Your\nSafe\nSpace';

  @override
  String get chat_wellness_subtitle =>
      'Gentle guidance shaped around your unique rhythm.';

  @override
  String get chat_ovya_label => 'OVYA';

  @override
  String get chat_greeting =>
      'Hey! I noticed your sleep has been a bit off this week. Want some gentle tips to help you rest better?';

  @override
  String get chat_thinking => 'Thinking...';

  @override
  String get chat_chip_sleep => 'SLEEP';

  @override
  String get chat_chip_stress => 'STRESS';

  @override
  String get chat_chip_hormonal => 'HORMONES';

  @override
  String get chat_chip_diet => 'FOOD';

  @override
  String get chat_input_placeholder => 'Tell me how you\'re feeling...';

  @override
  String get chat_companion_note => 'OVYA IS YOUR COMPANION, NOT A DOCTOR.';

  @override
  String get chat_suggest_sleep => 'Help me sleep better';

  @override
  String get chat_suggest_stress => 'How do I manage stress with PCOS?';

  @override
  String get chat_suggest_hormonal => 'Tips for hormonal balance';

  @override
  String get chat_suggest_diet => 'What should I eat for PCOS?';

  @override
  String get report_preview_demographics => 'Your details and report date';

  @override
  String get report_preview_risk => 'Risk score and PCOS pattern';

  @override
  String get report_preview_logs => '30-day symptom overview';

  @override
  String get report_preview_recs => 'Personalised suggestions';

  @override
  String get report_enter_name => 'Please enter your name';

  @override
  String get log_saved => 'Saved! You\'re doing great ✓';

  @override
  String get no_risk_data =>
      'No data yet. Log your symptoms first to see insights.';

  @override
  String get history_title => 'My Journey';

  @override
  String get history_recent_assessments => 'Recent Check-ins';

  @override
  String get history_daily_logs => 'Daily Logs';

  @override
  String get history_no_assessments =>
      'No check-ins yet. Start logging to see how you\'re doing!';

  @override
  String get history_no_logs =>
      'Nothing here yet. Start tracking to build your story.';

  @override
  String get history_general_profile => 'General Profile';

  @override
  String get history_no_symptoms_tag => 'NO SYMPTOMS LOGGED';

  @override
  String get analysis_complete => 'YOUR RESULTS ARE READY';

  @override
  String get insulin_resistant_pcos_indicator => 'Insulin-Resistant Pattern';

  @override
  String get androgenic_pcos_indicator => 'Androgenic Pattern';

  @override
  String get adrenal_pcos_indicator => 'Adrenal Pattern';

  @override
  String get general_pcos_indicator => 'General Pattern';

  @override
  String get hormonal_imbalance_detected => 'We noticed some hormonal shifts';

  @override
  String get risk_explanation_high =>
      'Based on what you\'ve shared — fatigue, irregular periods, and other signs — your body might be going through some hormonal changes. This is common and manageable.';

  @override
  String get risk_explanation_medium =>
      'Some of your symptoms show patterns worth keeping an eye on. Regular tracking will help us understand better.';

  @override
  String get risk_explanation_low =>
      'Things look steady! Keep tracking so we can catch any changes early.';

  @override
  String get insight_explanation_insulin =>
      'Your body might be finding it hard to process sugar smoothly, which can cause energy dips and mood shifts during the day. This is really common and can be managed with small lifestyle tweaks.';

  @override
  String get insight_explanation_androgenic =>
      'Your symptoms suggest slightly elevated androgen levels, which can show up as skin or hair changes. This is one of the most common PCOS patterns and responds well to gentle care.';

  @override
  String get insight_explanation_adrenal =>
      'Your pattern points to stress-related hormonal shifts. The good news? This type responds really well to relaxation, good sleep, and stress management.';

  @override
  String get insight_explanation_general =>
      'Your symptoms show some common PCOS patterns. With consistent tracking and the right guidance, these are very manageable.';

  @override
  String get action_balanced_meals_title => 'Eat balanced, nourishing meals';

  @override
  String get action_balanced_meals_subtitle =>
      'Think protein, fibre, and healthy fats with every meal.';

  @override
  String get action_light_movement_title => 'Move a little every day';

  @override
  String get action_light_movement_subtitle =>
      'Even a 15-min walk after meals can help with insulin.';

  @override
  String get action_sleep_title => 'Give your body proper rest';

  @override
  String get action_sleep_subtitle =>
      'Aim for 7-8 hours — your hormones will thank you.';

  @override
  String get action_skin_care_title => 'Be gentle with your skin';

  @override
  String get action_skin_care_subtitle =>
      'Mild cleansers and targeted treatments can help a lot.';

  @override
  String get action_anti_inflammatory_title => 'Add anti-inflammatory foods';

  @override
  String get action_anti_inflammatory_subtitle =>
      'Turmeric, omega-3s, and leafy greens are your friends.';

  @override
  String get action_consult_title => 'Talk to a specialist';

  @override
  String get action_consult_subtitle =>
      'An endocrinologist can help check your hormone levels.';

  @override
  String get action_stress_title => 'Find your calm';

  @override
  String get action_stress_subtitle =>
      'Try yoga, meditation, or just some deep breaths daily.';

  @override
  String get action_cortisol_title => 'Balance your cortisol';

  @override
  String get action_cortisol_subtitle =>
      'Less caffeine, more restful sleep. Small changes, big impact.';

  @override
  String get action_adaptogens_title => 'Try natural adaptogens';

  @override
  String get action_adaptogens_subtitle =>
      'Ashwagandha and tulsi can help your body handle stress.';

  @override
  String get wellness_tip_intro => 'Start your morning with warm herbal tea';

  @override
  String get wellness_tip_body =>
      '— it can ease bloating and help your tummy feel calmer.';

  @override
  String get ask_ovya_anything => 'Ask Ovya anything';

  @override
  String get report_generated_success => 'Your report is ready!';
}
