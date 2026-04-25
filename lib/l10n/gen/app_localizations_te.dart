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
  String get synced_just_now => 'అన్నీ సేవ్ అయ్యాయి';

  @override
  String get syncing => 'సేవ్ అవుతోంది...';

  @override
  String get elevated_risk => 'గమనించండి';

  @override
  String get pcos_detected => 'మీ శరీరం కొన్ని సంకేతాలు ఇస్తోంది';

  @override
  String get review_assessment => 'ఏం జరుగుతుందో చూడండి';

  @override
  String get todays_focus => 'మీ రోజు';

  @override
  String get log_today => 'ఈరోజు ఎలా ఉన్నారు?';

  @override
  String get doctor_report => 'డాక్టర్ రిపోర్ట్';

  @override
  String get ask_ovya => 'ఓవ్యాతో మాట్లాడండి';

  @override
  String get my_history => 'నా ప్రయాణం';

  @override
  String get mindful_moment => 'మీకోసం ఒక క్షణం';

  @override
  String get results_title => 'మీ వివరాలు';

  @override
  String get results_subtitle => 'మీ శరీరం ఏం చెబుతోంది';

  @override
  String get high_risk => 'ఎక్కువ';

  @override
  String get moderate_risk => 'మధ్యస్థం';

  @override
  String get low_risk => 'తక్కువ';

  @override
  String get what_this_means => 'దీని అర్థం ఏమిటి';

  @override
  String get what_to_do_next => 'సహాయపడే చిన్న అడుగులు';

  @override
  String get generate_report => 'రిపోర్ట్ తయారు చేయండి';

  @override
  String get continue_tracking => 'లక్షణాలను నమోదు చేస్తూ ఉండండి';

  @override
  String your_body_today(String style_body) {
    return 'ఈరోజు మీ $style_body';
  }

  @override
  String get energy_mood => 'మీ ఎనర్జీ ఎలా ఉంది?';

  @override
  String get symptoms_sensations => 'మీకు ఎలా అనిపిస్తోంది?';

  @override
  String get journal_notes => 'మీ నోట్స్';

  @override
  String get journal_hint =>
      'ఈరోజు ఎలా అనిపిస్తోంది? ఏదైనా ప్రత్యేకంగా ఉందా...';

  @override
  String get take_a_breath =>
      'మీరు చాలా బాగా చేస్తున్నారు. ఒకసారి దీర్ఘంగా ఊపిరి పీల్చుకోండి.';

  @override
  String get save_log => 'సేవ్ చేయండి';

  @override
  String get symptom_headache => 'తలనొప్పి';

  @override
  String get symptom_cramps => 'కడుపు నొప్పి';

  @override
  String get symptom_fatigue => 'అలసట';

  @override
  String get symptom_bloating => 'కడుపు ఉబ్బరం';

  @override
  String get symptom_nausea => 'వాంతి వచ్చినట్లు ఉండటం';

  @override
  String get symptom_backache => 'నడుము నొప్పి';

  @override
  String get symptom_insomnia => 'నిద్ర పట్టకపోవడం';

  @override
  String get logout_dialog_title => 'ఇంత త్వరగా వెళ్తున్నారా?';

  @override
  String logout_dialog_content(String pendingCount) {
    return 'మీ $pendingCount వివరాలు ఇంకా సేవ్ కాలేదు. లాగ్ అవుట్ చేస్తే అవి పోవచ్చు.';
  }

  @override
  String get logout_dialog_confirm => 'పర్వాలేదు, లాగౌట్ చేయండి';

  @override
  String get logout_dialog_stay => 'ఉండండి';

  @override
  String get sync_dialog_title => 'సేవ్ చేసే సమయం';

  @override
  String sync_dialog_content(String pendingCount) {
    return 'మీ $pendingCount వివరాలు ఆఫ్‌లైన్‌లో ఉన్నాయి. ఇప్పుడే సేవ్ చేయాలా?';
  }

  @override
  String get discard => 'తీసివేయండి';

  @override
  String get later => 'తర్వాత';

  @override
  String get syncNow => 'ఇప్పుడే సేవ్ చేయండి';

  @override
  String get auth_sign_in => 'సైన్ ఇన్';

  @override
  String get auth_sign_up => 'అకౌంట్ క్రియేట్ చేయండి';

  @override
  String get auth_email => 'ఈమెయిల్';

  @override
  String get auth_password => 'పాస్‌వర్డ్';

  @override
  String get auth_confirm_password => 'పాస్‌వర్డ్ నిర్ధారించండి';

  @override
  String get auth_error_passwords_no_match => 'పాస్‌వర్డ్‌లు సరిపోలడం లేదు';

  @override
  String get auth_create_account => 'అకౌంట్ క్రియేట్ చేయండి';

  @override
  String get continueText => 'ముందుకు సాగండి';

  @override
  String get chat_title => 'చాట్';

  @override
  String chat_context_card(String level) {
    return 'విషయం: $level';
  }

  @override
  String get chat_offline_banner => 'మీరు ప్రస్తుతం ఆఫ్‌లైన్‌లో ఉన్నారు';

  @override
  String get chat_disclaimer =>
      'ఇది కేవలం సమాచారం కోసం, రోగ నిర్ధారణ కోసం కాదు';

  @override
  String get chat_suggested_title => 'అడిగి చూడండి';

  @override
  String get chat_suggestion_1 => 'మంచి నిద్ర ఎలా పొందాలి?';

  @override
  String get chat_suggestion_2 => 'ఒత్తిడి తగ్గించుకునే మార్గాలు';

  @override
  String get chat_suggestion_3 => 'ఈరోజు ఏం తినాలి?';

  @override
  String get chat_offline_tooltip => 'ఆఫ్‌లైన్';

  @override
  String get chat_input_hint => 'ఏదైనా టైప్ చేయండి...';

  @override
  String get btn_generate_report => 'రిపోర్ట్ తయారు చేయండి';

  @override
  String get report_offline_note =>
      'మీ రిపోర్ట్ మీ ఫోన్‌లోనే తయారు చేయబడింది. ఏదీ బయటకు వెళ్లదు.';

  @override
  String get report_patient_name => 'మీ పేరు';

  @override
  String get report_preview_title => 'రిపోర్ట్‌లో ఏముంటుంది';

  @override
  String get report_share_btn => 'షేర్ చేయండి';

  @override
  String get report_print_btn => 'ప్రింట్ చేయండి';

  @override
  String get pdfTitle => 'ఓవ్యా ఆరోగ్య రిపోర్ట్';

  @override
  String pdfDateGenerated(String dateStr) {
    return '$dateStr న తయారు చేయబడింది';
  }

  @override
  String get pdfDisclaimer =>
      'ఈ రిపోర్ట్ సమాచారం కోసం మాత్రమే, డాక్టర్ సలహాకు ప్రత్యామ్నాయం కాదు.';

  @override
  String get pdfGeneratedBy => 'ఓవ్యా ద్వారా తయారు చేయబడింది';

  @override
  String get patientDetails => 'మీ గురించి';

  @override
  String patientNameLabel(String patientName) {
    return 'పేరు: $patientName';
  }

  @override
  String reportDateLabel(String nowStr) {
    return 'తేదీ: $nowStr';
  }

  @override
  String get riskAssessment => 'రిస్క్ అవలోకనం';

  @override
  String get riskLevelLabel => 'రిస్క్ స్థాయి';

  @override
  String get scoreLabel => 'స్కోర్';

  @override
  String get pcosTypeHintLabel => 'PCOS ప్యాట్రన్';

  @override
  String pcos_type_hint(String hint) {
    return 'ప్యాట్రన్: $hint';
  }

  @override
  String get explanationLabel => 'దీని అర్థం';

  @override
  String get recommendations => 'మీరు ఏం చేయగలరు';

  @override
  String get symptomsLast30Days => 'గత 30 రోజుల లక్షణాలు';

  @override
  String get noSymptoms30Days => 'గత 30 రోజుల్లో ఎటువంటి లక్షణాలు నమోదు కాలేదు';

  @override
  String get tableHeaderDate => 'తేదీ';

  @override
  String get tableHeaderSymptoms => 'లక్షణాలు';

  @override
  String get tableHeaderMood => 'మూడ్';

  @override
  String get irregularCycle => 'క్రమం లేని పీరియడ్స్';

  @override
  String get acne => 'మొటిమలు';

  @override
  String get weightGain => 'బరువులో మార్పులు';

  @override
  String get excessHairGrowth => 'అవాంఛిత రోమాలు';

  @override
  String get moodIssues => 'మూడ్ స్వింగ్స్';

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
  String get tableNone => 'ఏమీ లేవు';

  @override
  String get rec_track_regularly => 'రోజూ ట్రాక్ చేస్తూ ఉండండి';

  @override
  String get rec_balanced_diet => 'సమతుల్య ఆహారం తీసుకోండి';

  @override
  String get rec_schedule_checkup => 'చెక్-అప్ చేయించుకోండి';

  @override
  String get rec_monitor_cycle => 'మీ పీరియడ్స్ గమనిస్తూ ఉండండి';

  @override
  String get rec_stress_management => 'ఒత్తిడిని తగ్గించుకునే మార్గాలు చూడండి';

  @override
  String get rec_consult_gynecologist => 'గైనకాలజిస్ట్‌ని కలవండి';

  @override
  String get rec_request_bloodwork => 'బ్లడ్ టెస్ట్ చేయించుకోండి';

  @override
  String get rec_symptom_diary => 'లక్షణాల డైరీ నిర్వహించండి';

  @override
  String get type_insulin_resistant => 'ఇన్సులిన్ రెసిస్టెంట్';

  @override
  String get type_androgenic => 'ఆండ్రోజెనిక్';

  @override
  String get type_adrenal => 'అడ్రినల్';

  @override
  String get low => 'తక్కువ';

  @override
  String get medium => 'మధ్యస్థం';

  @override
  String get high => 'ఎక్కువ';

  @override
  String get your_body_prefix => 'ఈరోజు మీ ';

  @override
  String get your_body_word => 'శరీరం';

  @override
  String get your_body_suffix => '';

  @override
  String get mindful_ashwagandha_title => 'అశ్వగంధ టీ';

  @override
  String get mindful_ashwagandha_desc =>
      'మనస్సును ప్రశాంతపరుస్తుంది మరియు హార్మోన్లను బ్యాలెన్స్ చేయడానికి సహాయపడుతుంది.';

  @override
  String get chat_ask_ovya_title => 'ఓవ్యాతో మాట్లాడండి';

  @override
  String get chat_personal_guide => 'మీ వెల్నెస్ స్నేహితురాలు';

  @override
  String get chat_wellness_sanctuary => 'మీ\nసురక్షిత\nప్రదేశం';

  @override
  String get chat_wellness_subtitle =>
      'మీ అవసరాలకు అనుగుణంగా రూపొందించబడిన మార్గదర్శకత్వం.';

  @override
  String get chat_ovya_label => 'ఓవ్యా';

  @override
  String get chat_greeting =>
      'హలో! ఈ వారం మీ నిద్ర కొద్దిగా అస్థిరంగా ఉన్నట్లు అనిపిస్తోంది. మీరు బాగా విశ్రాంతి తీసుకోవడానికి కొన్ని చిట్కాలు కావాలా?';

  @override
  String get chat_thinking => 'ఆలోచిస్తోంది...';

  @override
  String get chat_chip_sleep => 'నిద్ర';

  @override
  String get chat_chip_stress => 'ఒత్తిడి';

  @override
  String get chat_chip_hormonal => 'హార్మోన్లు';

  @override
  String get chat_chip_diet => 'ఆహారం';

  @override
  String get chat_input_placeholder => 'మీకు ఎలా అనిపిస్తుందో చెప్పండి...';

  @override
  String get chat_companion_note =>
      'ఓవ్యా మీ స్నేహితురాలు మాత్రమే, డాక్టర్ కాదు.';

  @override
  String get chat_suggest_sleep => 'మంచి నిద్ర కోసం ఏమి చేయాలి?';

  @override
  String get chat_suggest_stress => 'PCOSతో ఒత్తిడిని ఎలా తగ్గించుకోవాలి?';

  @override
  String get chat_suggest_hormonal => 'హార్మోన్లను ఎలా బ్యాలెన్స్ చేయాలి?';

  @override
  String get chat_suggest_diet => 'PCOS కోసం ఏం తినాలి?';

  @override
  String get report_preview_demographics => 'మీ వివరాలు మరియు రిపోర్ట్ తేదీ';

  @override
  String get report_preview_risk => 'రిస్క్ స్కోర్ మరియు PCOS ప్యాట్రన్';

  @override
  String get report_preview_logs => '30 రోజుల లక్షణాల సారాంశం';

  @override
  String get report_preview_recs => 'మీ కోసం సలహాలు';

  @override
  String get report_enter_name => 'దయచేసి మీ పేరు రాయండి';

  @override
  String get log_saved => 'సేవ్ అయ్యింది! మీరు బాగా చేస్తున్నారు ✓';

  @override
  String get no_risk_data =>
      'ఇంకా డేటా లేదు. వివరాలు తెలుసుకోవడానికి ముందు మీ లక్షణాలను నమోదు చేయండి.';

  @override
  String get history_title => 'నా ప్రయాణం';

  @override
  String get history_recent_assessments => 'ఇటీవలి చెకప్‌లు';

  @override
  String get history_daily_logs => 'రోజువారీ లాగ్స్';

  @override
  String get history_no_assessments =>
      'ఇంకా చెకప్‌లు లేవు. నమోదు చేయడం ప్రారంభించండి!';

  @override
  String get history_no_logs => 'ఇంకా ఏమీ లేవు. ట్రాక్ చేయడం ప్రారంభించండి.';

  @override
  String get history_general_profile => 'సాధారణ ప్రొఫైల్';

  @override
  String get history_no_symptoms_tag => 'ఎటువంటి లక్షణాలు నమోదు కాలేదు';

  @override
  String get analysis_complete => 'మీ ఫలితాలు సిద్ధంగా ఉన్నాయి';

  @override
  String get insulin_resistant_pcos_indicator =>
      'ఇన్సులిన్ రెసిస్టెంట్ ప్యాట్రన్';

  @override
  String get androgenic_pcos_indicator => 'ఆండ్రోజెనిక్ ప్యాట్రన్';

  @override
  String get adrenal_pcos_indicator => 'అడ్రినల్ ప్యాట్రన్';

  @override
  String get general_pcos_indicator => 'సాధారణ ప్యాట్రన్';

  @override
  String get hormonal_imbalance_detected =>
      'కొన్ని హార్మోన్ల మార్పులను మేము గమనించాము';

  @override
  String get risk_explanation_high =>
      'మీరు పంచుకున్న సమాచారం ఆధారంగా — అలసట, క్రమరహిత పీరియడ్స్ మరియు ఇతర లక్షణాలు — మీ శరీరంలో కొన్ని హార్మోన్ల మార్పులు జరుగుతున్నట్లు అనిపిస్తోంది. చింతించకండి, ఇది చాలా సాధారణం.';

  @override
  String get risk_explanation_medium =>
      'మీ కొన్ని లక్షణాలు పర్యవేక్షించాల్సిన ప్యాట్రన్‌లను చూపుతున్నాయి. క్రమం తప్పకుండా ట్రాక్ చేయడం వల్ల మనకు బాగా అర్థమవుతుంది.';

  @override
  String get risk_explanation_low =>
      'అంతా బాగానే ఉన్నట్లు అనిపిస్తోంది! ఎటువంటి మార్పులైనా త్వరగా పసిగట్టడానికి ట్రాక్ చేస్తూ ఉండండి.';

  @override
  String get insight_explanation_insulin =>
      'మీ శరీరానికి చక్కెరను ప్రాసెస్ చేయడం కొద్దిగా కష్టంగా ఉండవచ్చు, దీనివల్ల పగటిపూట ఎనర్జీ తగ్గడం మరియు మూడ్ మారడం జరగవచ్చు. ఇది చాలా సాధారణం మరియు చిన్న మార్పులతో సులభంగా నిర్వహించవచ్చు.';

  @override
  String get insight_explanation_androgenic =>
      'లక్షణాలను బట్టి చూస్తే ఆండ్రోజెన్ హార్మోన్ కొంచెం పెరిగినట్లు అనిపిస్తోంది, దీని ప్రభావం చర్మం మరియు జుట్టుపై కనిపించవచ్చు. ఇది PCOSలో అత్యంత సాధారణ రకం మరియు సరైన జాగ్రత్తలతో మెరుగుపడుతుంది.';

  @override
  String get insight_explanation_adrenal =>
      'ఒత్తిడి వల్ల మీ హార్మోన్ల పై ప్రభావం పడుతున్నట్లు అనిపిస్తోంది. మంచి విషయం ఏమిటంటే, విశ్రాంతి, మంచి నిద్ర మరియు ఒత్తిడిని తగ్గించుకోవడం ద్వారా ఈ రకంలో చాలా మెరుగుదల చూడవచ్చు.';

  @override
  String get insight_explanation_general =>
      'మీ లక్షణాలు కొన్ని సాధారణ PCOS ప్యాట్రన్‌లను చూపుతున్నాయి. క్రమబద్ధమైన ట్రాకింగ్ మరియు సరైన మార్గదర్శకత్వంతో, వీటిని సులభంగా నిర్వహించవచ్చు.';

  @override
  String get action_balanced_meals_title =>
      'పోషకమైన మరియు సమతుల్య ఆహారం తీసుకోండి';

  @override
  String get action_balanced_meals_subtitle =>
      'ప్రతి భోజనంలో ప్రోటీన్, ఫైబర్ మరియు ఆరోగ్యకరమైన కొవ్వులను చేర్చండి.';

  @override
  String get action_light_movement_title => 'ప్రతిరోజూ కొంచెం నడవండి';

  @override
  String get action_light_movement_subtitle =>
      'భోజనం తర్వాత 15 నిమిషాల నడక ఇన్సులిన్‌ను నియంత్రించడంలో సహాయపడుతుంది.';

  @override
  String get action_sleep_title => 'మీ శరీరానికి సరైన విశ్రాంతి ఇవ్వండి';

  @override
  String get action_sleep_subtitle =>
      '7-8 గంటలు నిద్రపోండి — మీ హార్మోన్లకు ఇది అవసరం.';

  @override
  String get action_skin_care_title => 'చర్మం పట్ల శ్రద్ధ వహించండి';

  @override
  String get action_skin_care_subtitle =>
      'సున్నితమైన క్లెన్సర్లు మరియు సరైన చికిత్సలు చాలా సహాయపడతాయి.';

  @override
  String get action_anti_inflammatory_title =>
      'మంటను తగ్గించే ఆహారాలను చేర్చండి';

  @override
  String get action_anti_inflammatory_subtitle =>
      'పసుపు, ఒమేగా-3 మరియు ఆకుకూరలు — ఇవి మీకు స్నేహితులు.';

  @override
  String get action_consult_title => 'నిపుణుడిని సంప్రదించండి';

  @override
  String get action_consult_subtitle =>
      'ఎండోక్రినాలజిస్ట్ హార్మోన్ స్థాయిలను పరీక్షించగలరు.';

  @override
  String get action_stress_title => 'మీ ప్రశాంతతను కనుగొనండి';

  @override
  String get action_stress_subtitle =>
      'యోగా, ధ్యానం లేదా కొద్దిగా దీర్ఘంగా ఊపిరి పీల్చుకోవడానికి ప్రయత్నించండి.';

  @override
  String get action_cortisol_title => 'కార్టిసాల్ బ్యాలెన్స్ చేయండి';

  @override
  String get action_cortisol_subtitle =>
      'తక్కువ కెఫిన్, మంచి నిద్ర. చిన్న మార్పులు, పెద్ద ప్రభావం.';

  @override
  String get action_adaptogens_title => 'సహజ అడాప్టోజెన్‌లను ప్రయత్నించండి';

  @override
  String get action_adaptogens_subtitle =>
      'అశ్వగంధ మరియు తులసి ఒత్తిడిని నిర్వహించడంలో సహాయపడతాయి.';

  @override
  String get wellness_tip_intro =>
      'వేడి హెర్బల్ టీతో మీ ఉదయాన్ని ప్రారంభించండి';

  @override
  String get wellness_tip_body =>
      '— ఇది కడుపు ఉబ్బరాన్ని తగ్గిస్తుంది మరియు మీ కడుపును ప్రశాంతపరుస్తుంది.';

  @override
  String get ask_ovya_anything => 'ఓవ్యాను ఏదైనా అడగండి';

  @override
  String get report_generated_success => 'మీ రిపోర్ట్ సిద్ధంగా ఉంది!';
}
