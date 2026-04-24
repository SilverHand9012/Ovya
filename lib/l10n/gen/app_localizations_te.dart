// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Ovya';

  @override
  String get greeting_morning => 'శుభోదయం,';

  @override
  String get synced_just_now => 'ఇప్పుడే సింక్ అయింది';

  @override
  String get syncing => 'సింక్ అవుతోంది...';

  @override
  String get elevated_risk => 'పెరిగిన ప్రమాద స్థాయి';

  @override
  String get pcos_detected => 'PCOS ప్రభావం గుర్తించబడింది';

  @override
  String get review_assessment => 'అంచనాను సమీక్షించండి';

  @override
  String get todays_focus => 'నేటి దృష్టి';

  @override
  String get log_today => 'నేడు నమోదు చేయండి';

  @override
  String get doctor_report => 'వైద్యుడి రిపోర్ట్';

  @override
  String get ask_ovya => 'Ovya ని అడగండి';

  @override
  String get my_history => 'నా ఆరోగ్య చరిత్ర';

  @override
  String get mindful_moment => 'సచేతన క్షణం';

  @override
  String get results_title => 'ఫలితాలు';

  @override
  String get high_risk => 'అధిక ప్రమాదం';

  @override
  String get moderate_risk => 'మధ్యస్థ ప్రమాదం';

  @override
  String get low_risk => 'తక్కువ ప్రమాదం';

  @override
  String get what_this_means => 'దీని అర్థం ఏమిటి?';

  @override
  String get what_to_do_next => 'తదుపరి ఏమి చేయాలి?';

  @override
  String get generate_report => 'వివరమైన నివేదికను రూపొందించండి';

  @override
  String get continue_tracking => 'లక్షణాలను నమోదు చేయడం కొనసాగించండి';

  @override
  String your_body_today(String style_body) {
    return 'నేడు మీ $style_body';
  }

  @override
  String get energy_mood => 'శక్తి మరియు మూడ్';

  @override
  String get symptoms_sensations => 'లక్షణాలు మరియు అనుభూతులు';

  @override
  String get journal_notes => 'జర్నల్ గమనికలు';

  @override
  String get journal_hint =>
      'మానసిక మరియు శారీరక అనుభూతి ఎలా ఉంది? ఏదైనా నిర్దిష్ట కారణాలు...';

  @override
  String get take_a_breath => 'ఒకసారి దీర్ఘంగా ఊపిరి తీసుకోండి.';

  @override
  String get save_log => 'లాగ్‌ను సేవ్ చేయండి';

  @override
  String get symptom_headache => 'తలనొప్పి';

  @override
  String get symptom_cramps => 'కడుపు నొప్పి/నొప్పులు';

  @override
  String get symptom_fatigue => 'అలసట';

  @override
  String get symptom_bloating => 'కడుపు ఉబ్బరం';

  @override
  String get symptom_nausea => 'కడుపులో తిప్పడం';

  @override
  String get symptom_backache => 'నడుము నొప్పి';

  @override
  String get symptom_insomnia => 'నిద్రలేమి';

  @override
  String get logout_dialog_title => 'Log Out';

  @override
  String logout_dialog_content(String pendingCount) {
    return 'You have $pendingCount unsynced logs. If you log out, they might be lost. Are you sure?';
  }

  @override
  String get logout_dialog_confirm => 'Log Out Anyway';

  @override
  String get logout_dialog_stay => 'Stay';

  @override
  String get sync_dialog_title => 'Sync Needed';

  @override
  String sync_dialog_content(String pendingCount) {
    return 'You have $pendingCount offline logs. Would you like to sync them now?';
  }

  @override
  String get discard => 'Discard';

  @override
  String get later => 'Later';

  @override
  String get syncNow => 'Sync Now';

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
  String get continueText => 'Continue';

  @override
  String get chat_title => 'Chat';

  @override
  String chat_context_card(String level) {
    return 'Context: $level';
  }

  @override
  String get chat_offline_banner => 'Offline mode';

  @override
  String get chat_disclaimer => 'Disclaimer';

  @override
  String get chat_suggested_title => 'Suggested';

  @override
  String get chat_suggestion_1 => 'Suggestion 1';

  @override
  String get chat_suggestion_2 => 'Suggestion 2';

  @override
  String get chat_suggestion_3 => 'Suggestion 3';

  @override
  String get chat_offline_tooltip => 'Offline';

  @override
  String get chat_input_hint => 'Type a message';

  @override
  String get btn_generate_report => 'Generate Report';

  @override
  String get report_offline_note => 'Offline Note';

  @override
  String get report_patient_name => 'Patient Name';

  @override
  String get report_preview_title => 'Preview';

  @override
  String get report_share_btn => 'Share';

  @override
  String get report_print_btn => 'Print';

  @override
  String get pdfTitle => 'PDF Title';

  @override
  String pdfDateGenerated(String dateStr) {
    return 'Generated on $dateStr';
  }

  @override
  String get pdfDisclaimer => 'Disclaimer';

  @override
  String get pdfGeneratedBy => 'Generated by';

  @override
  String get patientDetails => 'Patient Details';

  @override
  String patientNameLabel(String patientName) {
    return 'Name: $patientName';
  }

  @override
  String reportDateLabel(String nowStr) {
    return 'Date: $nowStr';
  }

  @override
  String get riskAssessment => 'Risk Assessment';

  @override
  String get riskLevelLabel => 'Risk Level';

  @override
  String get scoreLabel => 'Score';

  @override
  String get pcosTypeHintLabel => 'PCOS Type Hint';

  @override
  String pcos_type_hint(String hint) {
    return 'Hint: $hint';
  }

  @override
  String get explanationLabel => 'Explanation';

  @override
  String get recommendations => 'Recommendations';

  @override
  String get symptomsLast30Days => 'Symptoms in last 30 days';

  @override
  String get noSymptoms30Days => 'No symptoms in last 30 days';

  @override
  String get tableHeaderDate => 'Date';

  @override
  String get tableHeaderSymptoms => 'Symptoms';

  @override
  String get tableHeaderMood => 'Mood';

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
  String get hairThinning => 'Hair Thinning';

  @override
  String get skinDarkening => 'Skin Darkening';

  @override
  String get fatigue => 'Fatigue';

  @override
  String get sleepProblems => 'Sleep Problems';

  @override
  String get bloating => 'Bloating';

  @override
  String get tableNone => 'None';

  @override
  String get rec_track_regularly => 'Track regularly';

  @override
  String get rec_balanced_diet => 'Balanced diet';

  @override
  String get rec_schedule_checkup => 'Schedule checkup';

  @override
  String get rec_monitor_cycle => 'Monitor cycle';

  @override
  String get rec_stress_management => 'Stress management';

  @override
  String get rec_consult_gynecologist => 'Consult gynecologist';

  @override
  String get rec_request_bloodwork => 'Request bloodwork';

  @override
  String get rec_symptom_diary => 'Symptom diary';

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
  String get your_body_prefix => 'నేడు మీ ';

  @override
  String get your_body_word => 'శరీరం';

  @override
  String get your_body_suffix => '';

  @override
  String get mindful_ashwagandha_title => 'అశ్వగంధ టీ';

  @override
  String get mindful_ashwagandha_desc =>
      'కార్టిసాల్ స్థాయిలను తగ్గించడానికి మరియు హార్మోన్లను సమతుల్యం చేయడానికి సహాయపడుతుంది.';

  @override
  String get chat_ask_ovya_title => 'Ovya ని అడగండి';

  @override
  String get chat_personal_guide => 'వ్యక్తిగత మార్గదర్శి';

  @override
  String get chat_wellness_sanctuary => 'మీ\nఆరోగ్య\nనిలయం';

  @override
  String get chat_wellness_subtitle =>
      'మీ విశిష్ట చక్రం మరియు లయకు అనుగుణంగా రూపొందించిన సమాచారం.';

  @override
  String get chat_ovya_label => 'ఓవ్యా';

  @override
  String get chat_greeting =>
      'మీ లాగ్‌ల ప్రకారం, ఈ వారం మీ నిద్ర కొంచెం అస్థిరంగా ఉంది. మంచి విశ్రాంతి కోసం కొన్ని చిట్కాలు కావాలా?';

  @override
  String get chat_thinking => 'ఆలోచిస్తున్నాను...';

  @override
  String get chat_chip_sleep => 'నిద్ర పరిశుభ్రత';

  @override
  String get chat_chip_stress => 'ఒత్తిడి ఉపశమనం';

  @override
  String get chat_chip_hormonal => 'హార్మోన్ల సమతుల్యత';

  @override
  String get chat_chip_diet => 'ఆహార చిట్కాలు';

  @override
  String get chat_input_placeholder => 'మీకు ఎలా అనిపిస్తుందో చెప్పండి...';

  @override
  String get chat_companion_note => 'ఓవ్యా మీ తోడు మాత్రమే, డాక్టర్ కాదు.';

  @override
  String get chat_suggest_sleep => 'మంచి నిద్ర కోసం చిట్కాలు ఇవ్వండి';

  @override
  String get chat_suggest_stress => 'PCOSతో ఒత్తిడిని ఎలా నిర్వహించాలి?';

  @override
  String get chat_suggest_hormonal => 'హార్మోన్ల సమతుల్యత కోసం చిట్కాలు';

  @override
  String get chat_suggest_diet => 'PCOS కోసం ఏమి తినాలి?';

  @override
  String get report_preview_demographics => 'జన గణాంకాలు మరియు తేదీ';

  @override
  String get report_preview_risk => 'రిస్క్ స్కోరు మరియు PCOS రకం';

  @override
  String get report_preview_logs => 'గత 30 రోజుల లక్షణాల పట్టిక';

  @override
  String get report_preview_recs => 'వ్యక్తిగత సిఫార్సులు';

  @override
  String get report_enter_name => 'దయచేసి రోగి పేరును నమోదు చేయండి';

  @override
  String get log_saved => 'లాగ్ సేవ్ చేయబడింది ✓';

  @override
  String get no_risk_data =>
      'రిస్క్ డేటా అందుబాటులో లేదు. దయచేసి మొదట లక్షణాలను నమోదు చేయండి.';

  @override
  String get history_title => 'చరిత్ర';

  @override
  String get history_recent_assessments => 'ఇటీవల అంచనాలు';

  @override
  String get history_daily_logs => 'రోజువారీ లాగ్‌లు';

  @override
  String get history_no_assessments =>
      'ఇంకా అంచనాలు లేవు. ప్రారంభించడానికి మీ లక్షణాలను నమోదు చేయండి.';

  @override
  String get history_no_logs =>
      'ఇంకా లాగ్‌లు లేవు. మీ చరిత్ర చూడటానికి ట్రాకింగ్ ప్రారంభించండి.';

  @override
  String get history_general_profile => 'సామాన్య ప్రొఫైల్';

  @override
  String get history_no_symptoms_tag => 'లక్షణాలు నమోదు చేయలేదు';
}
