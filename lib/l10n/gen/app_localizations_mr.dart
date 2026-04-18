// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Ovya';

  @override
  String get continueText => 'पुढे जा';

  @override
  String get auth_sign_in => 'साइन इन करा';

  @override
  String get auth_sign_up => 'साइन अप करा';

  @override
  String get auth_email => 'ईमेल';

  @override
  String get auth_password => 'पासवर्ड';

  @override
  String get auth_confirm_password => 'पासवर्डची पुष्टी करा';

  @override
  String get auth_error_passwords_no_match => 'पासवर्ड जुळत नाहीत';

  @override
  String get auth_create_account => 'नवीन खाते तयार करा';

  @override
  String get auth_loading => 'लोड होत आहे...';

  @override
  String get logSymptoms => 'लक्षणे नोंदवा';

  @override
  String get howAreYouFeeling => 'आज तुम्हाला कसे वाटत आहे?';

  @override
  String get irregularCycle => 'अनियमित पाळी';

  @override
  String get acne => 'मुरुमे (Acne)';

  @override
  String get weightGain => 'वजन वाढणे';

  @override
  String get excessHairGrowth => 'अनावश्यक केस वाढणे';

  @override
  String get moodIssues => 'वारंवार मूड बदलणे';

  @override
  String get notesOptional => 'नोंदी (पर्यायी)';

  @override
  String get notesHint => 'इतर कोणतीही माहिती...';

  @override
  String get logSymptomsButton => 'लक्षणे नोंदवा';

  @override
  String get symptomsLoggedSuccess => 'लक्षणे यशस्वीरित्या नोंदवली!';

  @override
  String get history => 'इतिहास';

  @override
  String get noSymptoms => 'कोणतीही लक्षणे नाहीत';

  @override
  String riskLevel(String level) {
    return 'धोक्याची पातळी: $level';
  }

  @override
  String score(int value) {
    return 'स्कोर: $value';
  }

  @override
  String get recommendations => 'सल्ले';

  @override
  String get aiInsights => 'AI माहिती';

  @override
  String get generateInsight => 'माहिती मिळवा';

  @override
  String get noInsightsYet => 'अद्याप कोणतीही माहिती नाही';

  @override
  String get noInsightsDescription =>
      'प्रथम तुमची लक्षणे नोंदवा आणि नंतर सल्ल्यासाठी टॅप करा.';

  @override
  String get latestInsight => 'नवीनतम माहिती';

  @override
  String get cached => 'सेव्ह केलेले';

  @override
  String get aiGenerated => 'AI द्वारे निर्माण केलेले';

  @override
  String get previousInsights => 'मागील माहिती';

  @override
  String get disclaimer =>
      'ही एक सामान्य माहिती आहे. कृपया डॉक्टरांचा सल्ला घ्या.';

  @override
  String get clearCache => 'कॅश क्लिअर करा';

  @override
  String get viewInsights => 'माहिती पहा';

  @override
  String get offlineModeActive => 'ऑफलाइन मोड सुरू आहे';

  @override
  String get syncingData => 'डेटा सिंक होत आहे...';

  @override
  String get syncedSuccessfully => 'यशस्वीरित्या सिंक झाले';

  @override
  String get fetchingInsights => 'नवीन माहिती आणत आहे...';

  @override
  String get usingLastSaved => 'मागील सेव्ह केलेली माहिती दाखवत आहे';

  @override
  String get offlineShowingLast =>
      'आपण ऑफलाइन आहोत. आपली मागील माहिती दाखवत आहोत.';

  @override
  String get failedToLoad => 'लोड करण्यात अयशस्वी';

  @override
  String get failedToAdd => 'नोंद करण्यात अयशस्वी';

  @override
  String get failedToGenerate => 'निर्माण करण्यात अयशस्वी';

  @override
  String get rec_track_regularly =>
      'तुमच्या लक्षणांवर लक्ष ठेवा आणि ती नियमित नोंदवा.';

  @override
  String get rec_balanced_diet => 'सकस आहार आणि नियमित व्यायाम करा.';

  @override
  String get rec_schedule_checkup =>
      'तुमच्या डॉक्टरांचा सल्ला घेण्याचा विचार करा.';

  @override
  String get rec_monitor_cycle =>
      'तुमच्या मासिक पाळीकडे लक्ष द्या आणि बदलांची नोंद करा.';

  @override
  String get rec_stress_management =>
      'तणाव कमी करण्यासाठी योग किंवा ध्यान करा.';

  @override
  String get rec_consult_gynecologist =>
      'कृपया शक्य तितक्या लवकर स्त्रीरोगतज्ज्ञांचा (Gynecologist) सल्ला घ्या.';

  @override
  String get rec_request_bloodwork =>
      'तुमच्या हार्मोन आणि इन्सुलिनच्या पातळीसाठी रक्त तपासणी करा.';

  @override
  String get rec_symptom_diary =>
      'तुमच्या डॉक्टरांना माहिती देण्यासाठी लक्षणांची डायरी ठेवा.';

  @override
  String get q_irregular_cycle => 'तुमची मासिक पाळी अनियमित आहे का?';

  @override
  String get q_hair_growth =>
      'तुमच्या चेहऱ्यावर किंवा अंगावर अनावश्यक केस वाढले आहेत का?';

  @override
  String get q_family_history =>
      'तुमच्या कुटुंबात कोणाला पॉलीसिस्टिक ओव्हरी सिंड्रोम (PCOS) आहे का?';

  @override
  String get q_weight_gain => 'तुमचे वजन अचानक वाढले आहे का?';

  @override
  String get q_acne => 'तुम्हाला नेहमी मुरुमे (Acne) येतात का?';

  @override
  String get q_skin_darkening => 'तुमच्या त्वचेवर काळे डाग दिसतात का?';

  @override
  String get q_hair_thinning => 'तुमचे केस गळत आहेत किंवा विरळ होत आहेत का?';

  @override
  String get q_fatigue => 'तुम्हाला नेहमी थकवा जाणवतो का?';

  @override
  String get q_sleep_problems => 'तुम्हाला झोपायला त्रास होतो का?';

  @override
  String get q_bloating => 'तुम्हाला वारंवार पोट फुगल्यासारखे वाटते का?';

  @override
  String get q_mood_issues => 'तुमचा मूड वारंवार बदलतो का?';

  @override
  String get q_difficulty_conceiving =>
      'तुम्हाला गर्भधारणा करण्यास अडचण येत आहे का?';

  @override
  String get q_age_verification => 'तुमचे वय १८ किंवा उससे अधिक आहे का?';

  @override
  String get btn_yes => 'होय';

  @override
  String get btn_no => 'नाही';

  @override
  String progress_indicator(int current, int total) {
    return 'प्रश्न $current / $total';
  }

  @override
  String pcos_type_hint(String type) {
    return 'तुमची लक्षणे $type पॉलीसिस्टिक ओव्हरी सिंड्रोम (PCOS) दर्शवतात';
  }

  @override
  String get pcos_type_insulin_desc =>
      'तुमच्या शरीराला इन्सुलिन वापरण्यात अडचण येत आहे ज्यामुळे वजन वाढते.';

  @override
  String get pcos_type_androgenic_desc =>
      'पुरुष संप्रेरकांची वाढ झाल्यामुळे मुरुमे आणि अनावश्यक केस वाढतात.';

  @override
  String get pcos_type_adrenal_desc =>
      'हे सहसा तणावामुळे होणाऱ्या बदलांमुळे होते.';

  @override
  String get type_insulin_resistant => 'इन्सुलिन-प्रतिरोधक (Insulin-resistant)';

  @override
  String get type_androgenic => 'अँड्रोजेनिक (Androgenic)';

  @override
  String get type_adrenal => 'अड्रेनल (Adrenal)';

  @override
  String get btn_save_track => 'सेव्ह करा आणि लक्षणे नोंदवा';

  @override
  String get btn_generate_report => 'डॉक्टरांसाठी रिपोर्ट तयार करा';

  @override
  String log_date_header(String date) {
    return 'आज, $date';
  }

  @override
  String get log_symptoms_label => 'आजची लक्षणे निवडा';

  @override
  String get log_notes_label => 'आजच्यासाठी काही नोंदी?';

  @override
  String get log_save_button => 'सेव्ह करा';

  @override
  String get log_saved_success => 'यशस्वीरित्या सेव्ह केले ✓';

  @override
  String get log_already_logged => 'आज आधीच नोंदवले आहे';

  @override
  String get report_patient_name => 'रुग्णाचे नाव';

  @override
  String get report_preview_title => 'रिपोर्टचे पूर्वावलोकन';

  @override
  String get report_share_btn => 'WhatsApp वर शेअर करा';

  @override
  String get report_print_btn => 'प्रिंट करा';

  @override
  String get report_offline_note =>
      'हा रिपोर्ट पूर्णपणे सुरक्षित आणि ऑफलाइन तयार केला आहे.';

  @override
  String get home_hello => 'नमस्कार';

  @override
  String get home_good_morning => 'शुभ सकाळ';

  @override
  String get home_good_afternoon => 'शुभ दुपार';

  @override
  String get home_good_evening => 'शुभ संध्याकाळ';

  @override
  String get home_time_today => 'आज';

  @override
  String get home_time_yesterday => 'काल';

  @override
  String home_time_days_ago(int days) {
    return '$days दिवसांपूर्वी';
  }

  @override
  String get home_start_assessment => 'आरोग्य तपासणी सुरू करा';

  @override
  String get home_rerun_assessment => 'पुन्हा तपासणी करा';

  @override
  String get home_card_log => 'लक्षणे नोंदवा';

  @override
  String get home_logged_done => 'झाले ✓';

  @override
  String get home_logged_today => 'आज';

  @override
  String get home_card_report => 'रिपोर्ट मिळवा';

  @override
  String get home_card_report_sub => 'डॉक्टरांशी शेअर करा';

  @override
  String get home_card_ai => 'Ovya ला विचारा';

  @override
  String get home_card_ai_ready => 'तयार';

  @override
  String get home_card_ai_offline => 'फक्त ऑनलाइन';

  @override
  String get home_err_offline => 'या सुविधेसाठी इंटरनेटची आवश्यकता आहे.';

  @override
  String get home_card_history => 'माझा इतिहास';

  @override
  String get home_card_history_sub => 'मागील नोंदी पहा';

  @override
  String get home_empty_risk_title =>
      'तुमचा पॉलीसिस्टिक ओव्हरी सिंड्रोम (PCOS) धोका येथे दिसेल';

  @override
  String get home_empty_risk_sub => 'फक्त 2 मिनिटे लागतील';

  @override
  String home_pcos_risk(String level) {
    return 'धोका: $level';
  }

  @override
  String home_type_hint(String hint) {
    return '$hint प्रकार';
  }

  @override
  String home_last_assessed(String time) {
    return 'शेवटची तपासणी: $time';
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
