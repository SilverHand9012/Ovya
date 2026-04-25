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
  String get greeting_morning => 'सुप्रभात,';

  @override
  String get synced_just_now => 'सब सेव हो गया';

  @override
  String get syncing => 'सेव हो रहा है...';

  @override
  String get elevated_risk => 'ध्यान दें';

  @override
  String get pcos_detected => 'शरीर कुछ संकेत दे रहा है';

  @override
  String get review_assessment => 'जानें क्या हो रहा है';

  @override
  String get todays_focus => 'आपका दिन';

  @override
  String get log_today => 'आज कैसा लग रहा है?';

  @override
  String get doctor_report => 'डॉक्टर रिपोर्ट';

  @override
  String get ask_ovya => 'ओव्या से बात करें';

  @override
  String get my_history => 'मेरा सफर';

  @override
  String get mindful_moment => 'अपने लिए एक पल';

  @override
  String get results_title => 'आपकी जानकारी';

  @override
  String get results_subtitle => 'आपका शरीर क्या बता रहा है';

  @override
  String get high_risk => 'ज़्यादा';

  @override
  String get moderate_risk => 'मध्यम';

  @override
  String get low_risk => 'कम';

  @override
  String get what_this_means => 'आपके लिए इसका मतलब';

  @override
  String get what_to_do_next => 'छोटे कदम जो मदद करें';

  @override
  String get generate_report => 'रिपोर्ट तैयार करें';

  @override
  String get continue_tracking => 'लक्षण नोट करते रहें';

  @override
  String your_body_today(String style_body) {
    return 'आज आपका $style_body';
  }

  @override
  String get energy_mood => 'एनर्जी कैसी है?';

  @override
  String get symptoms_sensations => 'क्या महसूस हो रहा है?';

  @override
  String get journal_notes => 'आपके नोट्स';

  @override
  String get journal_hint => 'आज कैसा महसूस हो रहा है? कुछ खास बात...';

  @override
  String get take_a_breath => 'बहुत अच्छा कर रही हो। एक गहरी सांस लो।';

  @override
  String get save_log => 'सेव करें';

  @override
  String get symptom_headache => 'सिरदर्द';

  @override
  String get symptom_cramps => 'ऐंठन';

  @override
  String get symptom_fatigue => 'थकान';

  @override
  String get symptom_bloating => 'पेट फूलना';

  @override
  String get symptom_nausea => 'जी मिचलाना';

  @override
  String get symptom_backache => 'कमर दर्द';

  @override
  String get symptom_insomnia => 'नींद नहीं आती';

  @override
  String get logout_dialog_title => 'इतनी जल्दी जा रही हो?';

  @override
  String logout_dialog_content(String pendingCount) {
    return 'आपके $pendingCount एंट्री अभी सेव नहीं हुई हैं। लॉग आउट करने पर ये खो सकती हैं।';
  }

  @override
  String get logout_dialog_confirm => 'फिर भी बाहर जाएं';

  @override
  String get logout_dialog_stay => 'रुकें';

  @override
  String get sync_dialog_title => 'सेव करने का समय';

  @override
  String sync_dialog_content(String pendingCount) {
    return 'आपके $pendingCount एंट्री ऑफलाइन हैं। अभी सेव करना चाहेंगी?';
  }

  @override
  String get discard => 'हटाएं';

  @override
  String get later => 'बाद में';

  @override
  String get syncNow => 'अभी सेव करें';

  @override
  String get auth_sign_in => 'साइन इन';

  @override
  String get auth_sign_up => 'अकाउंट बनाएं';

  @override
  String get auth_email => 'ईमेल';

  @override
  String get auth_password => 'पासवर्ड';

  @override
  String get auth_confirm_password => 'पासवर्ड दोबारा लिखें';

  @override
  String get auth_error_passwords_no_match => 'पासवर्ड मैच नहीं हो रहे';

  @override
  String get auth_create_account => 'अकाउंट बनाएं';

  @override
  String get continueText => 'आगे बढ़ें';

  @override
  String get chat_title => 'बातचीत';

  @override
  String chat_context_card(String level) {
    return 'विषय: $level';
  }

  @override
  String get chat_offline_banner => 'अभी ऑफलाइन हैं';

  @override
  String get chat_disclaimer => 'जागरूकता के लिए, डायग्नोसिस नहीं';

  @override
  String get chat_suggested_title => 'पूछकर देखें';

  @override
  String get chat_suggestion_1 => 'अच्छी नींद कैसे आए?';

  @override
  String get chat_suggestion_2 => 'तनाव कम करने के उपाय';

  @override
  String get chat_suggestion_3 => 'आज क्या खाना चाहिए?';

  @override
  String get chat_offline_tooltip => 'ऑफलाइन';

  @override
  String get chat_input_hint => 'कुछ लिखें...';

  @override
  String get btn_generate_report => 'रिपोर्ट बनाएं';

  @override
  String get report_offline_note =>
      'रिपोर्ट आपके फोन में बनती है। कुछ भी बाहर नहीं जाता।';

  @override
  String get report_patient_name => 'आपका नाम';

  @override
  String get report_preview_title => 'रिपोर्ट में क्या होगा';

  @override
  String get report_share_btn => 'शेयर करें';

  @override
  String get report_print_btn => 'प्रिंट करें';

  @override
  String get pdfTitle => 'Ovya हेल्थ रिपोर्ट';

  @override
  String pdfDateGenerated(String dateStr) {
    return '$dateStr को बनाई गई';
  }

  @override
  String get pdfDisclaimer =>
      'यह रिपोर्ट सिर्फ जानकारी के लिए है, डॉक्टर की सलाह की जगह नहीं है।';

  @override
  String get pdfGeneratedBy => 'Ovya द्वारा बनाई गई';

  @override
  String get patientDetails => 'आपके बारे में';

  @override
  String patientNameLabel(String patientName) {
    return 'नाम: $patientName';
  }

  @override
  String reportDateLabel(String nowStr) {
    return 'तारीख: $nowStr';
  }

  @override
  String get riskAssessment => 'रिस्क ओवरव्यू';

  @override
  String get riskLevelLabel => 'रिस्क लेवल';

  @override
  String get scoreLabel => 'स्कोर';

  @override
  String get pcosTypeHintLabel => 'PCOS पैटर्न';

  @override
  String pcos_type_hint(String hint) {
    return 'पैटर्न: $hint';
  }

  @override
  String get explanationLabel => 'इसका मतलब';

  @override
  String get recommendations => 'क्या कर सकती हैं';

  @override
  String get symptomsLast30Days => 'पिछले 30 दिन के लक्षण';

  @override
  String get noSymptoms30Days => 'पिछले 30 दिनों में कोई लक्षण नहीं';

  @override
  String get tableHeaderDate => 'तारीख';

  @override
  String get tableHeaderSymptoms => 'लक्षण';

  @override
  String get tableHeaderMood => 'मूड';

  @override
  String get irregularCycle => 'अनियमित पीरियड्स';

  @override
  String get acne => 'मुंहासे';

  @override
  String get weightGain => 'वजन में बदलाव';

  @override
  String get excessHairGrowth => 'ज्यादा बाल उगना';

  @override
  String get moodIssues => 'मूड स्विंग्स';

  @override
  String get hairThinning => 'बाल पतले होना';

  @override
  String get skinDarkening => 'स्किन डार्क होना';

  @override
  String get fatigue => 'थकान';

  @override
  String get sleepProblems => 'नींद की दिक्कत';

  @override
  String get bloating => 'पेट फूलना';

  @override
  String get tableNone => 'कोई नहीं';

  @override
  String get rec_track_regularly => 'रोज़ ट्रैक करती रहें';

  @override
  String get rec_balanced_diet => 'संतुलित खाना खाएं';

  @override
  String get rec_schedule_checkup => 'चेकअप करवाएं';

  @override
  String get rec_monitor_cycle => 'पीरियड्स पर नज़र रखें';

  @override
  String get rec_stress_management => 'तनाव से राहत पाएं';

  @override
  String get rec_consult_gynecologist => 'गायनेकोलॉजिस्ट से मिलें';

  @override
  String get rec_request_bloodwork => 'ब्लड टेस्ट करवाएं';

  @override
  String get rec_symptom_diary => 'लक्षण डायरी लिखें';

  @override
  String get type_insulin_resistant => 'इंसुलिन रेसिस्टेंट';

  @override
  String get type_androgenic => 'एंड्रोजेनिक';

  @override
  String get type_adrenal => 'एड्रिनल';

  @override
  String get low => 'कम';

  @override
  String get medium => 'मध्यम';

  @override
  String get high => 'ज्यादा';

  @override
  String get your_body_prefix => 'आज आपका ';

  @override
  String get your_body_word => 'शरीर';

  @override
  String get your_body_suffix => '';

  @override
  String get mindful_ashwagandha_title => 'अश्वगंधा चाय';

  @override
  String get mindful_ashwagandha_desc =>
      'मन को शांत करती है और हार्मोन्स को बैलेंस करने में मदद करती है।';

  @override
  String get chat_ask_ovya_title => 'ओव्या से बात करें';

  @override
  String get chat_personal_guide => 'आपकी वेलनेस साथी';

  @override
  String get chat_wellness_sanctuary => 'आपकी\nअपनी\nजगह';

  @override
  String get chat_wellness_subtitle => 'आपकी ज़रूरतों के हिसाब से बनी सलाह।';

  @override
  String get chat_ovya_label => 'ओव्या';

  @override
  String get chat_greeting =>
      'हैलो! इस हफ्ते आपकी नींद थोड़ी अनियमित लग रही है। चाहेंगी कि मैं कुछ आसान टिप्स बताऊं?';

  @override
  String get chat_thinking => 'सोच रही हूं...';

  @override
  String get chat_chip_sleep => 'नींद';

  @override
  String get chat_chip_stress => 'तनाव';

  @override
  String get chat_chip_hormonal => 'हार्मोन्स';

  @override
  String get chat_chip_diet => 'खानपान';

  @override
  String get chat_input_placeholder => 'बताइए आप कैसा महसूस कर रही हैं...';

  @override
  String get chat_companion_note => 'ओव्या आपकी साथी है, डॉक्टर नहीं।';

  @override
  String get chat_suggest_sleep => 'अच्छी नींद के लिए क्या करूं?';

  @override
  String get chat_suggest_stress => 'PCOS में तनाव कैसे कम करूं?';

  @override
  String get chat_suggest_hormonal => 'हार्मोन्स बैलेंस कैसे करूं?';

  @override
  String get chat_suggest_diet => 'PCOS में क्या खाना अच्छा रहेगा?';

  @override
  String get report_preview_demographics => 'आपकी जानकारी और रिपोर्ट की तारीख';

  @override
  String get report_preview_risk => 'रिस्क स्कोर और PCOS पैटर्न';

  @override
  String get report_preview_logs => '30 दिनों के लक्षणों का सार';

  @override
  String get report_preview_recs => 'आपके लिए सुझाव';

  @override
  String get report_enter_name => 'अपना नाम लिखें';

  @override
  String get log_saved => 'सेव हो गया! बहुत अच्छा ✓';

  @override
  String get no_risk_data => 'अभी कोई डेटा नहीं है। पहले लक्षण नोट करें।';

  @override
  String get history_title => 'मेरा सफर';

  @override
  String get history_recent_assessments => 'हाल की जांच';

  @override
  String get history_daily_logs => 'रोज़ के लॉग';

  @override
  String get history_no_assessments =>
      'अभी कोई जांच नहीं। लक्षण नोट करना शुरू करें!';

  @override
  String get history_no_logs => 'अभी कुछ नहीं है। ट्रैक करना शुरू करें।';

  @override
  String get history_general_profile => 'सामान्य प्रोफाइल';

  @override
  String get history_no_symptoms_tag => 'कोई लक्षण नोट नहीं हुआ';

  @override
  String get analysis_complete => 'आपके नतीजे तैयार हैं';

  @override
  String get insulin_resistant_pcos_indicator => 'इंसुलिन रेसिस्टेंट पैटर्न';

  @override
  String get androgenic_pcos_indicator => 'एंड्रोजेनिक पैटर्न';

  @override
  String get adrenal_pcos_indicator => 'एड्रिनल पैटर्न';

  @override
  String get general_pcos_indicator => 'सामान्य पैटर्न';

  @override
  String get hormonal_imbalance_detected => 'कुछ हार्मोनल बदलाव दिख रहे हैं';

  @override
  String get risk_explanation_high =>
      'आपने जो बताया है — थकान, अनियमित पीरियड्स, और कुछ और संकेत — लगता है शरीर में कुछ हार्मोनल बदलाव हो रहे हैं। चिंता की बात नहीं, ये काफी आम है।';

  @override
  String get risk_explanation_medium =>
      'आपके कुछ लक्षणों में एक पैटर्न दिख रहा है। रोज़ ट्रैक करते रहें ताकि हम बेहतर समझ सकें।';

  @override
  String get risk_explanation_low =>
      'सब ठीक लग रहा है! ट्रैक करते रहें ताकि कोई बदलाव जल्दी पकड़ में आ जाए।';

  @override
  String get insight_explanation_insulin =>
      'आपके शरीर को शुगर प्रोसेस करने में थोड़ी दिक्कत हो रही है, जिससे दिन में एनर्जी कम लग सकती है और मूड बदलता रहता है। ये बहुत आम है और छोटे बदलावों से ठीक हो सकता है।';

  @override
  String get insight_explanation_androgenic =>
      'लक्षणों से लगता है कि एंड्रोजन हार्मोन थोड़ा ज्यादा है, जिसका असर स्किन और बालों पर दिख सकता है। ये PCOS का सबसे आम टाइप है और सही देखभाल से ठीक होता है।';

  @override
  String get insight_explanation_adrenal =>
      'लगता है तनाव से हार्मोन्स पर असर हो रहा है। अच्छी बात ये है कि इस टाइप में आराम, अच्छी नींद और तनाव कम करने से बहुत फायदा होता है।';

  @override
  String get insight_explanation_general =>
      'आपके लक्षण PCOS के कुछ आम पैटर्न दिखा रहे हैं। रोज़ ट्रैक करें और सही गाइडेंस लें — ये काफी मैनेज हो सकता है।';

  @override
  String get action_balanced_meals_title => 'पोषक और संतुलित खाना खाएं';

  @override
  String get action_balanced_meals_subtitle =>
      'हर खाने में प्रोटीन, फाइबर और अच्छी फैट रखें।';

  @override
  String get action_light_movement_title => 'रोज़ थोड़ा चलें';

  @override
  String get action_light_movement_subtitle =>
      'खाने के बाद 15 मिनट की सैर इंसुलिन में मदद करती है।';

  @override
  String get action_sleep_title => 'शरीर को अच्छी नींद दें';

  @override
  String get action_sleep_subtitle =>
      '7-8 घंटे सोएं — हार्मोन्स को इसकी ज़रूरत है।';

  @override
  String get action_skin_care_title => 'स्किन का ख्याल रखें';

  @override
  String get action_skin_care_subtitle =>
      'हल्के क्लींज़र और सही ट्रीटमेंट काफी मदद करते हैं।';

  @override
  String get action_anti_inflammatory_title =>
      'सूजन कम करने वाले खाद्य पदार्थ खाएं';

  @override
  String get action_anti_inflammatory_subtitle =>
      'हल्दी, ओमेगा-3 और हरी सब्ज़ियां — ये आपकी दोस्त हैं।';

  @override
  String get action_consult_title => 'किसी एक्सपर्ट से बात करें';

  @override
  String get action_consult_subtitle =>
      'एंडोक्रिनोलॉजिस्ट हार्मोन लेवल चेक कर सकते हैं।';

  @override
  String get action_stress_title => 'अपनी शांति खोजें';

  @override
  String get action_stress_subtitle =>
      'योग, ध्यान या सिर्फ गहरी सांसें — रोज़ थोड़ा सा।';

  @override
  String get action_cortisol_title => 'कोर्टिसोल बैलेंस रखें';

  @override
  String get action_cortisol_subtitle =>
      'कम कैफीन, अच्छी नींद। छोटे बदलाव, बड़ा फर्क।';

  @override
  String get action_adaptogens_title => 'नेचुरल एडैप्टोजन आज़माएं';

  @override
  String get action_adaptogens_subtitle =>
      'अश्वगंधा और तुलसी तनाव से लड़ने में मदद करते हैं।';

  @override
  String get wellness_tip_intro => 'सुबह गर्म हर्बल चाय से शुरू करें';

  @override
  String get wellness_tip_body =>
      '— पेट की तकलीफ कम होती है और मन भी शांत रहता है।';

  @override
  String get ask_ovya_anything => 'ओव्या से कुछ भी पूछें';

  @override
  String get report_generated_success => 'रिपोर्ट तैयार है!';

  @override
  String get q_irregular_cycle =>
      'क्या आपके मासिक धर्म (पीरियड्स) अनियमित हैं?';

  @override
  String get q_hair_growth => 'क्या आपके चेहरे या शरीर पर अनचाहे बाल हैं?';

  @override
  String get q_family_history =>
      'क्या आपके परिवार में किसी को PCOS की समस्या है?';

  @override
  String get q_weight_gain => 'क्या आपका वजन बिना किसी कारण के बढ़ रहा है?';

  @override
  String get q_acne => 'क्या आपको गंभीर मुंहासों की समस्या है?';

  @override
  String get q_skin_darkening =>
      'क्या आपकी त्वचा (जैसे गर्दन के आसपास) काली पड़ रही है?';

  @override
  String get q_hair_thinning => 'क्या आपके बाल झड़ रहे हैं या पतले हो रहे हैं?';

  @override
  String get q_fatigue => 'क्या आपको अक्सर बहुत अधिक थकान महसूस होती है?';

  @override
  String get q_sleep_problems => 'क्या आपको सोने में परेशानी होती है?';

  @override
  String get q_bloating => 'क्या आपको अक्सर पेट फूलने की समस्या होती है?';

  @override
  String get q_mood_issues =>
      'क्या आपको अक्सर मूड स्विंग्स (मिज़ाज बदलना) की समस्या होती है?';

  @override
  String get q_over_18 => 'क्या आपकी उम्र 18 वर्ष से अधिक है?';

  @override
  String get q_difficulty_conceiving =>
      'क्या आपको गर्भधारण करने में परेशानी हो रही है?';

  @override
  String get trackCycle => 'साइकिल ट्रैक करें';

  @override
  String get logPeriodDates => 'अपनी पीरियड की तारीखें दर्ज करें';

  @override
  String get auth_welcome_title => 'ओव्या में आपका स्वागत है';

  @override
  String get auth_welcome_subtitle =>
      'आपके स्वास्थ्य को समझने और प्रबंधित करने में आपका साथी';

  @override
  String get auth_login_signup_btn => 'लॉग इन / साइन अप';

  @override
  String get auth_guest_btn => 'अतिथि के रूप में जारी रखें';

  @override
  String get auth_private_secure => 'आपका डेटा निजी और सुरक्षित रहता है';

  @override
  String get auth_gently_guided => 'आपका स्वास्थ्य, कोमलता से निर्देशित';

  @override
  String get auth_email_hint => 'you@example.com';

  @override
  String get auth_password_hint => '........';

  @override
  String get auth_forgot_password => 'पासवर्ड भूल गए?';

  @override
  String get auth_or => 'या';

  @override
  String get auth_continue_google => 'Google के साथ जारी रखें';

  @override
  String get auth_dont_have_account => 'खाता नहीं है? ';

  @override
  String get auth_full_name => 'पूरा नाम';

  @override
  String get auth_name_hint => 'Jane Doe';

  @override
  String get auth_email_address => 'ईमेल पता';

  @override
  String get auth_already_have_account => 'क्या आपके पास पहले से खाता है? ';
}
