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
  String get continueText => 'కొనసాగించండి';

  @override
  String get auth_sign_in => 'సైన్ ఇన్ చేయండి';

  @override
  String get auth_sign_up => 'సైన్ అప్ చేయండి';

  @override
  String get auth_email => 'ఈమెయిల్';

  @override
  String get auth_password => 'పాస్‌వర్డ్';

  @override
  String get auth_confirm_password => 'పాస్‌వర్డ్‌ను నిర్ధారించండి';

  @override
  String get auth_error_passwords_no_match => 'పాస్‌వర్డ్‌లు సరిపోలడం లేదు';

  @override
  String get auth_create_account => 'ఖాతాను సృష్టించండి';

  @override
  String get auth_loading => 'లోడ్ అవుతోంది...';

  @override
  String get logSymptoms => 'లక్షణాలను నమోదు చేయండి';

  @override
  String get howAreYouFeeling => 'ఈరోజు మీకు ఎలా అనిపిస్తుంది?';

  @override
  String get irregularCycle => 'సక్రమంగా లేని రుతుక్రమం';

  @override
  String get acne => 'మొటిమలు (Acne)';

  @override
  String get weightGain => 'బరువు పెరగడం';

  @override
  String get excessHairGrowth => 'అవాంఛిత రోమాలు';

  @override
  String get moodIssues => 'మానసిక స్థితి మార్పులు';

  @override
  String get notesOptional => 'గమనికలు (ఐచ్ఛికం)';

  @override
  String get notesHint => 'మరేదైనా అదనపు సమాచారం ఉంటే...';

  @override
  String get logSymptomsButton => 'లక్షణాలను నమోదు చేయండి';

  @override
  String get symptomsLoggedSuccess => 'లక్షణాలు విజయవంతంగా నమోదు చేయబడ్డాయి!';

  @override
  String get history => 'చరిత్ర';

  @override
  String get noSymptoms => 'లక్షణాలు లేవు';

  @override
  String riskLevel(String level) {
    return 'ప్రమాద స్థాయి: $level';
  }

  @override
  String score(int value) {
    return 'స్కోర్: $value';
  }

  @override
  String get recommendations => 'సలహాలు';

  @override
  String get aiInsights => 'AI సమాచారం';

  @override
  String get generateInsight => 'సమాచారం పొందండి';

  @override
  String get noInsightsYet => 'ఇంకా ఎలాంటి సమాచారం లేదు';

  @override
  String get noInsightsDescription =>
      'ముందుగా మీ లక్షణాలను నమోదు చేసి, సలహా కోసం ట్యాప్ చేయండి.';

  @override
  String get latestInsight => 'తాజా సమాచారం';

  @override
  String get cached => 'సేవ్ చేయబడింది';

  @override
  String get aiGenerated => 'AI ద్వార సృష్టించబడింది';

  @override
  String get previousInsights => 'గతంలోని సమాచారం';

  @override
  String get disclaimer =>
      'ఇది కేవలం సమాచారం కోసం మాత్రమే. దయచేసి వైద్యుడిని సంప్రదించండి.';

  @override
  String get clearCache => 'కాష్ క్లియర్ చేయండి';

  @override
  String get viewInsights => 'సమాచారం చూడండి';

  @override
  String get offlineModeActive => 'ఆఫ్‌లైన్ మోడ్ యాక్టివ్‌గా ఉంది';

  @override
  String get syncingData => 'డేటా సింక్ అవుతోంది...';

  @override
  String get syncedSuccessfully => 'సింక్ విజయవంతమైంది';

  @override
  String get fetchingInsights => 'కొత్త సమాచారాన్ని పొందుతున్నాము...';

  @override
  String get usingLastSaved => 'చివరిగా సేవ్ చేసిన సమాచారాన్ని చూపిస్తున్నాము';

  @override
  String get offlineShowingLast =>
      'మేము ఆఫ్‌లైన్‌లో ఉన్నాము. పాత సమాచారాన్ని చూపిస్తున్నాము.';

  @override
  String get failedToLoad => 'లోడ్ చేయడంలో విఫలమైంది';

  @override
  String get failedToAdd => 'జోడించడంలో విఫలమైంది';

  @override
  String get failedToGenerate => 'సృష్టించడంలో విఫలమైంది';

  @override
  String get rec_track_regularly =>
      'మీ లక్షణాలను గమనిస్తూ ఉండండి మరియు క్రమం తప్పకుండా నమోదు చేయండి.';

  @override
  String get rec_balanced_diet =>
      'ఆరోగ్యకరమైన ఆహారం మరియు రోజువారీ వ్యాయామం అలవాటు చేసుకోండి.';

  @override
  String get rec_schedule_checkup =>
      'మీ వైద్యునితో చెక్-అప్ షెడ్యూల్ చేయడం మంచిది.';

  @override
  String get rec_monitor_cycle =>
      'మీ రుతుక్రమాన్ని పరిశీలించండి మరియు మార్పులను గుర్తించండి.';

  @override
  String get rec_stress_management =>
      'ఒత్తిడి తగ్గించుకోవడానికి యోగా లేదా ధ్యానం చేయండి.';

  @override
  String get rec_consult_gynecologist =>
      'దయచేసి వీలైనంత త్వరగా గైనకాలజిస్ట్‌ను (Gynecologist) సంప్రదించండి.';

  @override
  String get rec_request_bloodwork =>
      'హార్మోన్ మరియు ఇన్సులిన్ స్థాయిలను పరిశీలించడానికి రక్త పరీక్ష చేయించండి.';

  @override
  String get rec_symptom_diary =>
      'మీ వైద్యుడితో చర్చించడానికి లక్షణాల డైరీని పెట్టుకోండి.';

  @override
  String get q_irregular_cycle => 'మీ ముట్టు సక్రమంగా లేదా అనూహ్యంగా ఉందా?';

  @override
  String get q_hair_growth =>
      'మీ ముఖం లేదా శరీరంపై అవాంఛిత రోమాలు పెరుగుతున్నాయా?';

  @override
  String get q_family_history =>
      'మీ కుటుంబంలో ఎవరికైనా పాలిసిస్టిక్ ఓవరీ సిండ్రోమ్ (PCOS) ఉందా?';

  @override
  String get q_weight_gain => 'ఎలాంటి కారణం లేకుండా మీరు బరువు పెరుగుతున్నారా?';

  @override
  String get q_acne => 'మీకు తరచుగా మొటిమలు (Acne) వస్తున్నాయా?';

  @override
  String get q_skin_darkening => 'మీ చర్మంపై నల్లటి మచ్చలు కనబడుతున్నాయా?';

  @override
  String get q_hair_thinning => 'మీ జుట్టు రాలుతోందా లేదా పలుచబడుతోందా?';

  @override
  String get q_fatigue => 'మీరు తరచుగా అలసటగా లేదా నీరసంగా భావిస్తున్నారా?';

  @override
  String get q_sleep_problems => 'మీకు నిద్రపోవడంలో ఇబ్బంది ఉందా?';

  @override
  String get q_bloating => 'మీకు తరచుగా కడుపు ఉబ్బరంగా అనిపిస్తుందా?';

  @override
  String get q_mood_issues => 'మీ మానసిక స్థితి (మూడ్) తరచుగా మారుతుంటుందా?';

  @override
  String get q_difficulty_conceiving =>
      'గర్భం దాల్చడంలో మీకు ఇబ్బంది ఎదురవుతోందా?';

  @override
  String get q_age_verification =>
      'మీ వయస్సు 18 సంవత్సరాలు లేదా అంతకంటే ఎక్కువ ఉందా?';

  @override
  String get btn_yes => 'అవును';

  @override
  String get btn_no => 'కాదు';

  @override
  String progress_indicator(int current, int total) {
    return 'ప్రశ్న $current / $total';
  }

  @override
  String pcos_type_hint(String type) {
    return 'లక్షణాలు మీకు $type పాలిసిస్టిక్ ఓవరీ సిండ్రోమ్ (PCOS) ఉందని సూచిస్తున్నాయి';
  }

  @override
  String get pcos_type_insulin_desc =>
      'మీ శరీరం ఇన్సులిన్‌ను సరిగ్గా వినియోగించలేకపోవడం వల్ల బరువు పెరుగుతారు.';

  @override
  String get pcos_type_androgenic_desc =>
      'పురుష హార్మోన్ల పెరుగుదల వల్ల అవాంఛిత రోమాలు మరియు మొటిమలు వస్తాయి.';

  @override
  String get pcos_type_adrenal_desc =>
      'ఇది తరచుగా ఒత్తిడికి ప్రతిస్పందనగా జరుగుతుంది.';

  @override
  String get type_insulin_resistant =>
      'ఇన్సులిన్-రెసిస్టెంట్ (Insulin-resistant)';

  @override
  String get type_androgenic => 'ఆండ్రోజెనిక్ (Androgenic)';

  @override
  String get type_adrenal => 'అడ్రినల్ (Adrenal)';

  @override
  String get btn_save_track => 'సేవ్ చేయండి';

  @override
  String get btn_generate_report => 'వైద్యుడి రిపోర్ట్ సృష్టించండి';

  @override
  String log_date_header(String date) {
    return 'ఈరోజు, $date';
  }

  @override
  String get log_symptoms_label => 'ఈరోజు మీ లక్షణాలను ఎంచుకోండి';

  @override
  String get log_notes_label => 'ఈరోజు గమనికలు?';

  @override
  String get log_save_button => 'సేవ్ చేయండి';

  @override
  String get log_saved_success => 'సేవ్ చేయబడింది ✓';

  @override
  String get log_already_logged => 'ఈరోజు ఇప్పటికే నమోదు చేశారు';

  @override
  String get report_patient_name => 'రోగి పేరు';

  @override
  String get report_preview_title => 'రిపోర్ట్ ప్రివ్యూ';

  @override
  String get report_share_btn => 'WhatsApp ద్వారా పంచుకోండి';

  @override
  String get report_print_btn => 'ప్రింట్ చేయండి';

  @override
  String get report_offline_note =>
      'ఈ రిపోర్ట్ ఆఫ్‌లైన్‌లో సురక్షితంగా రూపొందించబడింది.';

  @override
  String get home_hello => 'నమస్కారం';

  @override
  String get home_good_morning => 'శుభోదయం';

  @override
  String get home_good_afternoon => 'శుభ మధ్యాహ్నం';

  @override
  String get home_good_evening => 'శుభ సాయంత్రం';

  @override
  String get home_time_today => 'ఈ రోజు';

  @override
  String get home_time_yesterday => 'నిన్న';

  @override
  String home_time_days_ago(int days) {
    return '$days రోజుల క్రితం';
  }

  @override
  String get home_start_assessment => 'ఆరోగ్య అంచనా ప్రారంభించండి';

  @override
  String get home_rerun_assessment => 'మళ్లీ అంచనా వేయండి';

  @override
  String get home_card_log => 'లక్షణాలు నమోదు చేయండి';

  @override
  String get home_logged_done => 'పూర్తయింది ✓';

  @override
  String get home_logged_today => 'ఈరోజు';

  @override
  String get home_card_report => 'రిపోర్ట్ పొందండి';

  @override
  String get home_card_report_sub => 'వైద్యునితో పంచుకోండి';

  @override
  String get home_card_ai => 'Ovya ని అడగండి';

  @override
  String get home_card_ai_ready => 'సిద్ధంగా ఉంది';

  @override
  String get home_card_ai_offline => 'ఆన్‌లైన్ మాత్రమే';

  @override
  String get home_err_offline => 'ఈ ఫీచర్‌కు ఇంటర్నెట్ అవసరం.';

  @override
  String get home_card_history => 'నా చరిత్ర';

  @override
  String get home_card_history_sub => 'పాత రికార్డులు';

  @override
  String get home_empty_risk_title =>
      'మీ పాలిసిస్టిక్ ఓవరీ సిండ్రోమ్ (PCOS) అంచనా ఇక్కడ కనిపిస్తుంది';

  @override
  String get home_empty_risk_sub => 'కేవలం 2 నిమిషాలు పడుతుంది';

  @override
  String home_pcos_risk(String level) {
    return 'ప్రమాదం: $level';
  }

  @override
  String home_type_hint(String hint) {
    return '$hint రకం';
  }

  @override
  String home_last_assessed(String time) {
    return 'చివరి అంచనా: $time';
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
  String get pdfTitle => 'ఓవ్యా — PCOS ఆరోగ్య నివేదిక';

  @override
  String pdfDateGenerated(String date) {
    return 'సృష్టించబడిన తేదీ: $date';
  }

  @override
  String get pdfDisclaimer =>
      'ఈ నివేదిక కేవలం సమాచారం కోసం మాత్రమే. దయచేసి అర్హత కలిగిన వైద్యుడిని సంప్రదించండి.';

  @override
  String get pdfGeneratedBy =>
      'ఓవ్యా ద్వారా రూపొందించబడింది — మహిళా ఆరోగ్య భాగస్వామి';

  @override
  String get patientDetails => 'రోగి వివరాలు';

  @override
  String patientNameLabel(String name) {
    return 'పేరు: $name';
  }

  @override
  String reportDateLabel(String date) {
    return 'నివేదిక తేదీ: $date';
  }

  @override
  String get riskAssessment => 'ప్రమాద అంచనా';

  @override
  String get riskLevelLabel => 'ప్రమాద స్థాయి:';

  @override
  String get scoreLabel => 'స్కోరు:';

  @override
  String get pcosTypeHintLabel => 'PCOS రకం సూచన:';

  @override
  String get explanationLabel => 'వివరణ:';

  @override
  String get symptomsLast30Days => 'గత 30 రోజుల లక్షణాలు';

  @override
  String get noSymptoms30Days =>
      'గత 30 రోజుల్లో ఎటువంటి లక్షణాలు నమోదు కాలేదు.';

  @override
  String get tableHeaderDate => 'తేదీ';

  @override
  String get tableHeaderSymptoms => 'లక్షణాలు';

  @override
  String get tableHeaderMood => 'మూడ్/గమనికలు';

  @override
  String get tableNone => 'ఏదీ లేదు';

  @override
  String get low => 'తక్కువ';

  @override
  String get medium => 'మధ్యస్థం';

  @override
  String get high => 'ఎక్కువ';

  @override
  String get hairThinning => 'జుట్టు రాలడం';

  @override
  String get skinDarkening => 'చర్మం నల్లబడటం';

  @override
  String get fatigue => 'అలసట';

  @override
  String get sleepProblems => 'నిద్ర సమస్యలు';

  @override
  String get bloating => 'కడుపు ఉబ్బరం';

  @override
  String get logout_dialog_title => 'Unsaved data';

  @override
  String logout_dialog_content(String count) {
    return 'You have $count unsynced health logs. Logging out now will permanently delete this data.';
  }

  @override
  String get logout_dialog_stay => 'Stay';

  @override
  String get logout_dialog_confirm => 'Log out anyway';

  @override
  String get sync_dialog_title => 'Pending Offline Data';

  @override
  String sync_dialog_content(String count) {
    return 'You have $count unsynced logs offline. Would you like to sync them now?';
  }

  @override
  String get syncNow => 'Sync Now';

  @override
  String get discard => 'Discard';

  @override
  String get later => 'Later';
}
