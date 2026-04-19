// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Ovya';

  @override
  String get continueText => 'जारी रखें';

  @override
  String get auth_sign_in => 'साइन इन';

  @override
  String get auth_sign_up => 'साइन अप';

  @override
  String get auth_email => 'ईमेल';

  @override
  String get auth_password => 'पासवर्ड';

  @override
  String get auth_confirm_password => 'पासवर्ड की पुष्टि करें';

  @override
  String get auth_error_passwords_no_match => 'पासवर्ड मेल नहीं खाते';

  @override
  String get auth_create_account => 'खाता बनाएं';

  @override
  String get auth_loading => 'लोड हो रहा है...';

  @override
  String get logSymptoms => 'लक्षण दर्ज करें';

  @override
  String get howAreYouFeeling => 'आज आप कैसा महसूस कर रही हैं?';

  @override
  String get irregularCycle => 'अनियमित मासिक धर्म';

  @override
  String get acne => 'मुंहासे (Acne)';

  @override
  String get weightGain => 'वजन बढ़ना';

  @override
  String get excessHairGrowth => 'अनचाहे बाल बढ़ना';

  @override
  String get moodIssues => 'मूड में बदलाव';

  @override
  String get notesOptional => 'नोट्स (वैकल्पिक)';

  @override
  String get notesHint => 'कोई अन्य जानकारी...';

  @override
  String get logSymptomsButton => 'लक्षण दर्ज करें';

  @override
  String get symptomsLoggedSuccess => 'लक्षण सफलतापूर्वक दर्ज किए गए!';

  @override
  String get history => 'इतिहास';

  @override
  String get noSymptoms => 'कोई लक्षण नहीं';

  @override
  String riskLevel(String level) {
    return 'जोखिम स्तर: $level';
  }

  @override
  String score(int value) {
    return 'स्कोर: $value';
  }

  @override
  String get recommendations => 'सुझाव';

  @override
  String get aiInsights => 'AI जानकारी';

  @override
  String get generateInsight => 'जानकारी प्राप्त करें';

  @override
  String get noInsightsYet => 'अभी कोई जानकारी नहीं है';

  @override
  String get noInsightsDescription =>
      'पहले अपने लक्षण दर्ज करें, फिर सलाह के लिए \'जानकारी प्राप्त करें\' पर टैप करें।';

  @override
  String get latestInsight => 'नवीनतम जानकारी';

  @override
  String get cached => 'सहेजा गया';

  @override
  String get aiGenerated => 'AI द्वारा उत्पन्न';

  @override
  String get previousInsights => 'पिछली जानकारी';

  @override
  String get disclaimer =>
      'यह केवल जानकारी के लिए है और चिकित्सा निदान नहीं है। कृपया डॉक्टर से सलाह लें।';

  @override
  String get clearCache => 'कैश साफ़ करें';

  @override
  String get viewInsights => 'जानकारी देखें';

  @override
  String get offlineModeActive => 'ऑफ़लाइन मोड सक्रिय';

  @override
  String get syncingData => 'डेटा सिंक हो रहा है...';

  @override
  String get syncedSuccessfully => 'सिंक सफल रहा';

  @override
  String get fetchingInsights => 'नई जानकारी लाई जा रही है...';

  @override
  String get usingLastSaved => 'पिछली सहेजी गई जानकारी दिखा रहे हैं';

  @override
  String get offlineShowingLast =>
      'हम ऑफ़लाइन हैं। आपकी पिछली जानकारी दिखा रहे हैं।';

  @override
  String get failedToLoad => 'लोड करने में विफल';

  @override
  String get failedToAdd => 'जोड़ने में विफल';

  @override
  String get failedToGenerate => 'बनाने में विफल';

  @override
  String get rec_track_regularly =>
      'अपने लक्षणों पर ध्यान दें और उन्हें नियमित रूप से दर्ज करती रहें।';

  @override
  String get rec_balanced_diet => 'संतुलित आहार लें और नियमित व्यायाम करें।';

  @override
  String get rec_schedule_checkup =>
      'अपने डॉक्टर से मिलकर जांच कराने का विचार करें।';

  @override
  String get rec_monitor_cycle =>
      'अपने मासिक धर्म पर नज़र रखें और किसी भी बदलाव को नोट करें।';

  @override
  String get rec_stress_management => 'तनाव कम करने के लिए योग या ध्यान करें।';

  @override
  String get rec_consult_gynecologist =>
      'कृपया जल्द से जल्द किसी स्त्री रोग विशेषज्ञ (Gynecologist) से सलाह लें।';

  @override
  String get rec_request_bloodwork =>
      'खून की जांच करवाएं, जिसमें हार्मोन और इंसुलिन का स्तर शामिल हो।';

  @override
  String get rec_symptom_diary =>
      'अपने डॉक्टर के साथ साझा करने के लिए लक्षणों की एक डायरी बनाएं।';

  @override
  String get q_irregular_cycle =>
      'क्या आपके मासिक धर्म अनियमित हैं या छूट जाते हैं?';

  @override
  String get q_hair_growth =>
      'क्या आपने अपने चेहरे या शरीर पर अनचाहे बाल देखे हैं?';

  @override
  String get q_family_history =>
      'क्या आपके परिवार में किसी को पॉलीसिस्टिक ओवरी सिंड्रोम (PCOS) है?';

  @override
  String get q_weight_gain => 'क्या आपका वज़न बिना किसी कारण के बढ़ रहा है?';

  @override
  String get q_acne => 'क्या आपको बार-बार मुंहासे होते हैं?';

  @override
  String get q_skin_darkening => 'क्या आपने अपनी त्वचा पर काले धब्बे देखे हैं?';

  @override
  String get q_hair_thinning => 'क्या आपके बाल पतले हो रहे हैं या झड़ रहे हैं?';

  @override
  String get q_fatigue => 'क्या आप अक्सर थका हुआ या कमज़ोर महसूस करती हैं?';

  @override
  String get q_sleep_problems => 'क्या आपको सोने में परेशानी होती है?';

  @override
  String get q_bloating => 'क्या आपको अक्सर पेट फूलने की समस्या होती है?';

  @override
  String get q_mood_issues => 'क्या आपके मूड में बार-बार बदलाव होता है?';

  @override
  String get q_difficulty_conceiving =>
      'क्या आपको गर्भधारण करने में परेशानी हो रही है?';

  @override
  String get q_age_verification => 'क्या आपकी उम्र 18 वर्ष या उससे अधिक है?';

  @override
  String get btn_yes => 'हां';

  @override
  String get btn_no => 'नहीं';

  @override
  String progress_indicator(int current, int total) {
    return 'प्रश्न $current / $total';
  }

  @override
  String pcos_type_hint(String type) {
    return 'आपके लक्षण $type पॉलीसिस्टिक ओवरी सिंड्रोम (PCOS) का संकेत देते हैं';
  }

  @override
  String get pcos_type_insulin_desc =>
      'इसका मतलब है कि आपके शरीर को इंसुलिन का उपयोग करने में परेशानी हो रही है, जिससे वज़न बढ़ता है।';

  @override
  String get pcos_type_androgenic_desc =>
      'इसमें पुरुष हार्मोन का स्तर बढ़ जाता है, जिससे अनचाहे बाल और मुंहासे होते हैं।';

  @override
  String get pcos_type_adrenal_desc => 'यह अक्सर तनाव के कारण होता है।';

  @override
  String get type_insulin_resistant => 'इंसुलिन-प्रतिरोधी (Insulin-resistant)';

  @override
  String get type_androgenic => 'एंड्रोजेनिक (Androgenic)';

  @override
  String get type_adrenal => 'एड्रिनल (Adrenal)';

  @override
  String get btn_save_track => 'सहेजें और लक्षण ट्रैक करें';

  @override
  String get btn_generate_report => 'डॉक्टर की रिपोर्ट बनाएं';

  @override
  String log_date_header(String date) {
    return 'आज, $date';
  }

  @override
  String get log_symptoms_label => 'आज के अपने लक्षण चुनें';

  @override
  String get log_notes_label => 'आज के लिए कोई नोट्स?';

  @override
  String get log_save_button => 'सहेजें';

  @override
  String get log_saved_success => 'बचाया गया ✓';

  @override
  String get log_already_logged => 'आज पहले ही दर्ज किया जा चुका है';

  @override
  String get report_patient_name => 'रोगी का नाम';

  @override
  String get report_preview_title => 'रिपोर्ट पूर्वावलोकन';

  @override
  String get report_share_btn => 'WhatsApp पर शेयर करें';

  @override
  String get report_print_btn => 'प्रिंट करें';

  @override
  String get report_offline_note =>
      'यह रिपोर्ट सुरक्षित रूप से ऑफ़लाइन बनाई गई है।';

  @override
  String get home_hello => 'नमस्ते';

  @override
  String get home_good_morning => 'सुप्रभात';

  @override
  String get home_good_afternoon => 'शुभ दोपहर';

  @override
  String get home_good_evening => 'शुभ संध्या';

  @override
  String get home_time_today => 'आज';

  @override
  String get home_time_yesterday => 'कल';

  @override
  String home_time_days_ago(int days) {
    return '$days दिन पहले';
  }

  @override
  String get home_start_assessment => 'स्वास्थ्य मूल्यांकन शुरू करें';

  @override
  String get home_rerun_assessment => 'फिर से मूल्यांकन करें';

  @override
  String get home_card_log => 'लक्षण दर्ज करें';

  @override
  String get home_logged_done => 'हो गया ✓';

  @override
  String get home_logged_today => 'आज';

  @override
  String get home_card_report => 'रिपोर्ट प्राप्त करें';

  @override
  String get home_card_report_sub => 'डॉक्टर से साझा करें';

  @override
  String get home_card_ai => 'Ovya से पूछें';

  @override
  String get home_card_ai_ready => 'तैयार';

  @override
  String get home_card_ai_offline => 'केवल ऑनलाइन';

  @override
  String get home_err_offline =>
      'इस सुविधा के लिए इंटरनेट कनेक्शन की आवश्यकता है।';

  @override
  String get home_card_history => 'मेरा इतिहास';

  @override
  String get home_card_history_sub => 'पिछले रिकॉर्ड देखें';

  @override
  String get home_empty_risk_title =>
      'आपका पॉलीसिस्टिक ओवरी सिंड्रोम (PCOS) जोखिम मूल्यांकन यहाँ दिखेगा';

  @override
  String get home_empty_risk_sub => 'केवल 2 मिनट लगते हैं';

  @override
  String home_pcos_risk(String level) {
    return 'जोखिम: $level';
  }

  @override
  String home_type_hint(String hint) {
    return '$hint प्रकार';
  }

  @override
  String home_last_assessed(String time) {
    return 'पिछला मूल्यांकन: $time';
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
  String get pdfTitle =>
      'ओव्या — पीसीओएस स्वास्थ्य रिपोर्ट (PCOS Health Report)';

  @override
  String pdfDateGenerated(String date) {
    return 'उत्पन्न तिथि: $date';
  }

  @override
  String get pdfDisclaimer =>
      'यह रिपोर्ट केवल सूचनात्मक उद्देश्यों के लिए है। कृपया एक योग्य डॉक्टर से परामर्श लें।';

  @override
  String get pdfGeneratedBy => 'ओव्या द्वारा उत्पन्न — महिला स्वास्थ्य साथी';

  @override
  String get patientDetails => 'रोगी विवरण';

  @override
  String patientNameLabel(String name) {
    return 'नाम: $name';
  }

  @override
  String reportDateLabel(String date) {
    return 'रिपोर्ट तिथि: $date';
  }

  @override
  String get riskAssessment => 'जोखिम मूल्यांकन';

  @override
  String get riskLevelLabel => 'जोखिम स्तर:';

  @override
  String get scoreLabel => 'स्कोर:';

  @override
  String get pcosTypeHintLabel => 'पीसीओएस (PCOS) प्रकार संकेत:';

  @override
  String get explanationLabel => 'व्याख्या:';

  @override
  String get symptomsLast30Days => 'पिछले 30 दिनों के लक्षण';

  @override
  String get noSymptoms30Days =>
      'पिछले 30 दिनों में कोई लक्षण दर्ज नहीं किया गया।';

  @override
  String get tableHeaderDate => 'तारीख़';

  @override
  String get tableHeaderSymptoms => 'लक्षण';

  @override
  String get tableHeaderMood => 'मूड/नोट्स';

  @override
  String get tableNone => 'कोई नहीं';

  @override
  String get low => 'कम';

  @override
  String get medium => 'मध्यम';

  @override
  String get high => 'उच्च';

  @override
  String get hairThinning => 'बालों का पतला होना';

  @override
  String get skinDarkening => 'त्वचा का काला पड़ना';

  @override
  String get fatigue => 'थकान';

  @override
  String get sleepProblems => 'नींद की समस्या';

  @override
  String get bloating => 'पेट फूलना';

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
