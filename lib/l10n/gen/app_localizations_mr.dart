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
  String get greeting_morning => 'सुप्रभात,';

  @override
  String get synced_just_now => 'सगळं सेव्ह झालं';

  @override
  String get syncing => 'सेव्ह होतंय...';

  @override
  String get elevated_risk => 'लक्ष द्या';

  @override
  String get pcos_detected => 'शरीर काही संकेत देतंय';

  @override
  String get review_assessment => 'काय चाललंय ते बघा';

  @override
  String get todays_focus => 'आजचा दिवस';

  @override
  String get log_today => 'आज कसं वाटतंय?';

  @override
  String get doctor_report => 'डॉक्टर रिपोर्ट';

  @override
  String get ask_ovya => 'Ovya शी बोला';

  @override
  String get my_history => 'माझा प्रवास';

  @override
  String get mindful_moment => 'तुमच्यासाठी एक क्षण';

  @override
  String get results_title => 'तुमची माहिती';

  @override
  String get results_subtitle => 'तुमचं शरीर काय सांगतंय';

  @override
  String get high_risk => 'जास्त';

  @override
  String get moderate_risk => 'मध्यम';

  @override
  String get low_risk => 'कमी';

  @override
  String get what_this_means => 'तुमच्यासाठी याचा अर्थ';

  @override
  String get what_to_do_next => 'छोट्या गोष्टी ज्या मदत करतात';

  @override
  String get generate_report => 'रिपोर्ट तयार करा';

  @override
  String get continue_tracking => 'लक्षणे नोंदवत रहा';

  @override
  String your_body_today(String style_body) {
    return 'आज तुमचे $style_body';
  }

  @override
  String get energy_mood => 'एनर्जी कशी आहे?';

  @override
  String get symptoms_sensations => 'काय जाणवतंय?';

  @override
  String get journal_notes => 'तुमच्या नोट्स';

  @override
  String get journal_hint => 'आज कसं वाटतंय? काही विशेष...';

  @override
  String get take_a_breath => 'खूप छान करतेयस. एक दीर्घ श्वास घे.';

  @override
  String get save_log => 'सेव्ह करा';

  @override
  String get symptom_headache => 'डोकेदुखी';

  @override
  String get symptom_cramps => 'पोटात दुखणे';

  @override
  String get symptom_fatigue => 'थकवा';

  @override
  String get symptom_bloating => 'पोट फुगणे';

  @override
  String get symptom_nausea => 'मळमळ';

  @override
  String get symptom_backache => 'कंबरदुखी';

  @override
  String get symptom_insomnia => 'झोप नाही लागत';

  @override
  String get logout_dialog_title => 'एवढ्या लवकर जातेयस?';

  @override
  String logout_dialog_content(String pendingCount) {
    return 'तुमच्या $pendingCount एंट्री अजून सेव्ह झाल्या नाहीत. लॉग आउट केल्यास त्या हरवू शकतात.';
  }

  @override
  String get logout_dialog_confirm => 'तरीही बाहेर जा';

  @override
  String get logout_dialog_stay => 'थांबा';

  @override
  String get sync_dialog_title => 'सेव्ह करण्याची वेळ';

  @override
  String sync_dialog_content(String pendingCount) {
    return 'तुमच्या $pendingCount एंट्री ऑफलाइन आहेत. आत्ता सेव्ह करायच्या का?';
  }

  @override
  String get discard => 'काढून टाका';

  @override
  String get later => 'नंतर';

  @override
  String get syncNow => 'आत्ता सेव्ह करा';

  @override
  String get auth_sign_in => 'साइन इन';

  @override
  String get auth_sign_up => 'अकाउंट बनवा';

  @override
  String get auth_email => 'ईमेल';

  @override
  String get auth_password => 'पासवर्ड';

  @override
  String get auth_confirm_password => 'पासवर्ड पुन्हा लिहा';

  @override
  String get auth_error_passwords_no_match => 'पासवर्ड जुळत नाहीत';

  @override
  String get auth_create_account => 'अकाउंट बनवा';

  @override
  String get continueText => 'पुढे जा';

  @override
  String get chat_title => 'बोला';

  @override
  String chat_context_card(String level) {
    return 'विषय: $level';
  }

  @override
  String get chat_offline_banner => 'सध्या ऑफलाइन आहात';

  @override
  String get chat_disclaimer => 'माहितीसाठी, निदान नाही';

  @override
  String get chat_suggested_title => 'विचारून बघा';

  @override
  String get chat_suggestion_1 => 'चांगली झोप कशी येईल?';

  @override
  String get chat_suggestion_2 => 'ताण कमी करण्याचे उपाय';

  @override
  String get chat_suggestion_3 => 'आज काय खावं?';

  @override
  String get chat_offline_tooltip => 'ऑफलाइन';

  @override
  String get chat_input_hint => 'काहीतरी लिहा...';

  @override
  String get btn_generate_report => 'रिपोर्ट बनवा';

  @override
  String get report_offline_note =>
      'रिपोर्ट तुमच्या फोनवरच तयार होते. काहीही बाहेर जात नाही.';

  @override
  String get report_patient_name => 'तुमचे नाव';

  @override
  String get report_preview_title => 'रिपोर्ट मध्ये काय असेल';

  @override
  String get report_share_btn => 'शेअर करा';

  @override
  String get report_print_btn => 'प्रिंट करा';

  @override
  String get pdfTitle => 'Ovya आरोग्य रिपोर्ट';

  @override
  String pdfDateGenerated(String dateStr) {
    return '$dateStr ला तयार केली';
  }

  @override
  String get pdfDisclaimer =>
      'ही रिपोर्ट फक्त माहितीसाठी आहे, डॉक्टरांच्या सल्ल्याची जागा घेत नाही.';

  @override
  String get pdfGeneratedBy => 'Ovya ने तयार केली';

  @override
  String get patientDetails => 'तुमच्याबद्दल';

  @override
  String patientNameLabel(String patientName) {
    return 'नाव: $patientName';
  }

  @override
  String reportDateLabel(String nowStr) {
    return 'तारीख: $nowStr';
  }

  @override
  String get riskAssessment => 'रिस्क ओव्हरव्ह्यू';

  @override
  String get riskLevelLabel => 'रिस्क लेव्हल';

  @override
  String get scoreLabel => 'स्कोर';

  @override
  String get pcosTypeHintLabel => 'PCOS पॅटर्न';

  @override
  String pcos_type_hint(String hint) {
    return 'पॅटर्न: $hint';
  }

  @override
  String get explanationLabel => 'याचा अर्थ';

  @override
  String get recommendations => 'तुम्ही काय करू शकता';

  @override
  String get symptomsLast30Days => 'मागील 30 दिवसांची लक्षणे';

  @override
  String get noSymptoms30Days =>
      'मागील 30 दिवसांत कोणतीही लक्षणे नोंदवली नाहीत';

  @override
  String get tableHeaderDate => 'तारीख';

  @override
  String get tableHeaderSymptoms => 'लक्षणे';

  @override
  String get tableHeaderMood => 'मूड';

  @override
  String get irregularCycle => 'अनियमित पाळी';

  @override
  String get acne => 'पिंपल्स';

  @override
  String get weightGain => 'वजनात बदल';

  @override
  String get excessHairGrowth => 'जास्त केस येणे';

  @override
  String get moodIssues => 'मूड स्विंग्स';

  @override
  String get hairThinning => 'केस पातळ होणे';

  @override
  String get skinDarkening => 'त्वचा काळवंडणे';

  @override
  String get fatigue => 'थकवा';

  @override
  String get sleepProblems => 'झोपेचा त्रास';

  @override
  String get bloating => 'पोट फुगणे';

  @override
  String get tableNone => 'काहीच नाही';

  @override
  String get rec_track_regularly => 'रोज नोंदवत रहा';

  @override
  String get rec_balanced_diet => 'संतुलित जेवण घ्या';

  @override
  String get rec_schedule_checkup => 'चेकअप करून घ्या';

  @override
  String get rec_monitor_cycle => 'पाळीवर लक्ष ठेवा';

  @override
  String get rec_stress_management => 'ताण कमी करण्याचे मार्ग शोधा';

  @override
  String get rec_consult_gynecologist => 'गायनेकोलॉजिस्टशी बोला';

  @override
  String get rec_request_bloodwork => 'ब्लड टेस्ट करून घ्या';

  @override
  String get rec_symptom_diary => 'लक्षणांची डायरी ठेवा';

  @override
  String get type_insulin_resistant => 'इन्सुलिन रेसिस्टंट';

  @override
  String get type_androgenic => 'अँड्रोजेनिक';

  @override
  String get type_adrenal => 'अॅड्रेनल';

  @override
  String get low => 'कमी';

  @override
  String get medium => 'मध्यम';

  @override
  String get high => 'जास्त';

  @override
  String get your_body_prefix => 'आज तुमचे ';

  @override
  String get your_body_word => 'शरीर';

  @override
  String get your_body_suffix => '';

  @override
  String get mindful_ashwagandha_title => 'अश्वगंधा चहा';

  @override
  String get mindful_ashwagandha_desc =>
      'मनाला शांत करते आणि हार्मोन्स बॅलन्स करण्यात मदत करते.';

  @override
  String get chat_ask_ovya_title => 'Ovya शी बोला';

  @override
  String get chat_personal_guide => 'तुमची वेलनेस मैत्रीण';

  @override
  String get chat_wellness_sanctuary => 'तुमची\nस्वतःची\nजागा';

  @override
  String get chat_wellness_subtitle => 'तुमच्या गरजेनुसार तयार केलेले सल्ले.';

  @override
  String get chat_ovya_label => 'ओव्या';

  @override
  String get chat_greeting =>
      'हॅलो! या आठवड्यात तुमची झोप थोडी अनियमित वाटतेय. काही सोप्या टिप्स हव्या का?';

  @override
  String get chat_thinking => 'विचार करतेय...';

  @override
  String get chat_chip_sleep => 'झोप';

  @override
  String get chat_chip_stress => 'ताण';

  @override
  String get chat_chip_hormonal => 'हार्मोन्स';

  @override
  String get chat_chip_diet => 'आहार';

  @override
  String get chat_input_placeholder => 'कसं वाटतंय ते सांगा...';

  @override
  String get chat_companion_note => 'ओव्या तुमची साथीदार आहे, डॉक्टर नाही.';

  @override
  String get chat_suggest_sleep => 'चांगली झोप कशी लागेल?';

  @override
  String get chat_suggest_stress => 'PCOS मध्ये ताण कसा कमी करायचा?';

  @override
  String get chat_suggest_hormonal => 'हार्मोन्स बॅलन्स कसे करायचे?';

  @override
  String get chat_suggest_diet => 'PCOS साठी काय खावं?';

  @override
  String get report_preview_demographics => 'तुमची माहिती आणि रिपोर्ट तारीख';

  @override
  String get report_preview_risk => 'रिस्क स्कोर आणि PCOS पॅटर्न';

  @override
  String get report_preview_logs => '30 दिवसांच्या लक्षणांचा सारांश';

  @override
  String get report_preview_recs => 'तुमच्यासाठी सूचना';

  @override
  String get report_enter_name => 'तुमचे नाव लिहा';

  @override
  String get log_saved => 'सेव्ह झालं! छान करतेयस ✓';

  @override
  String get no_risk_data => 'अजून डेटा नाही. आधी लक्षणे नोंदवा.';

  @override
  String get history_title => 'माझा प्रवास';

  @override
  String get history_recent_assessments => 'अलीकडील तपासण्या';

  @override
  String get history_daily_logs => 'रोजचे लॉग';

  @override
  String get history_no_assessments =>
      'अजून तपासणी नाही. लक्षणे नोंदवायला सुरुवात करा!';

  @override
  String get history_no_logs => 'अजून काहीच नाही. ट्रॅक करायला सुरुवात करा.';

  @override
  String get history_general_profile => 'सामान्य प्रोफाइल';

  @override
  String get history_no_symptoms_tag => 'लक्षणे नोंदवली नाहीत';

  @override
  String get analysis_complete => 'तुमचे निकाल तयार आहेत';

  @override
  String get insulin_resistant_pcos_indicator => 'इन्सुलिन रेसिस्टंट पॅटर्न';

  @override
  String get androgenic_pcos_indicator => 'अँड्रोजेनिक पॅटर्न';

  @override
  String get adrenal_pcos_indicator => 'अॅड्रेनल पॅटर्न';

  @override
  String get general_pcos_indicator => 'सामान्य पॅटर्न';

  @override
  String get hormonal_imbalance_detected => 'काही हार्मोनल बदल दिसताहेत';

  @override
  String get risk_explanation_high =>
      'तुम्ही सांगितल्याप्रमाणे — थकवा, अनियमित पाळी, आणि इतर संकेत — शरीरात काही हार्मोनल बदल होत असावेत. काळजी करू नका, हे खूप सामान्य आहे.';

  @override
  String get risk_explanation_medium =>
      'तुमच्या काही लक्षणांमध्ये एक पॅटर्न दिसतोय. रोज ट्रॅक करा म्हणजे अजून चांगलं समजेल.';

  @override
  String get risk_explanation_low =>
      'सगळं ठीक दिसतंय! ट्रॅक करत रहा म्हणजे कोणताही बदल लवकर कळेल.';

  @override
  String get insight_explanation_insulin =>
      'तुमच्या शरीराला साखर प्रोसेस करायला थोडा त्रास होतोय, त्यामुळे दिवसभर एनर्जी कमी वाटू शकते आणि मूड बदलतो. हे खूप सामान्य आहे आणि छोट्या बदलांनी ठीक होऊ शकते.';

  @override
  String get insight_explanation_androgenic =>
      'लक्षणांवरून वाटतंय की अँड्रोजन हार्मोन थोडा जास्त आहे, त्याचा त्वचा आणि केसांवर परिणाम दिसू शकतो. हा PCOS चा सर्वात सामान्य प्रकार आहे आणि योग्य काळजीने ठीक होतो.';

  @override
  String get insight_explanation_adrenal =>
      'वाटतंय की तणावामुळे हार्मोन्सवर परिणाम होतोय. चांगली बातमी म्हणजे या प्रकारात विश्रांती, चांगली झोप आणि ताण कमी केल्यावर खूप फरक पडतो.';

  @override
  String get insight_explanation_general =>
      'तुमची लक्षणे PCOS चे काही सामान्य पॅटर्न दाखवतात. नियमित ट्रॅकिंग आणि योग्य मार्गदर्शन — हे व्यवस्थापित करता येतं.';

  @override
  String get action_balanced_meals_title => 'पौष्टिक आणि संतुलित जेवण घ्या';

  @override
  String get action_balanced_meals_subtitle =>
      'प्रत्येक जेवणात प्रथिने, फायबर आणि चांगले फॅट्स ठेवा.';

  @override
  String get action_light_movement_title => 'दररोज थोडं चाला';

  @override
  String get action_light_movement_subtitle =>
      'जेवणानंतर 15 मिनिटं चालणं इन्सुलिनसाठी मदत करतं.';

  @override
  String get action_sleep_title => 'शरीराला चांगली विश्रांती द्या';

  @override
  String get action_sleep_subtitle =>
      '7-8 तास झोपा — हार्मोन्सला याची गरज आहे.';

  @override
  String get action_skin_care_title => 'त्वचेची काळजी घ्या';

  @override
  String get action_skin_care_subtitle =>
      'सौम्य क्लीन्झर आणि योग्य ट्रीटमेंट खूप मदत करतात.';

  @override
  String get action_anti_inflammatory_title => 'सूज कमी करणारे पदार्थ खा';

  @override
  String get action_anti_inflammatory_subtitle =>
      'हळद, ओमेगा-3 आणि पालेभाज्या — तुमच्या मित्र आहेत.';

  @override
  String get action_consult_title => 'एक्सपर्टशी बोला';

  @override
  String get action_consult_subtitle =>
      'एंडोक्रिनोलॉजिस्ट हार्मोन लेव्हल तपासू शकतो.';

  @override
  String get action_stress_title => 'तुमची शांती शोधा';

  @override
  String get action_stress_subtitle =>
      'योग, ध्यान किंवा फक्त दीर्घ श्वास — रोज थोडं.';

  @override
  String get action_cortisol_title => 'कॉर्टिसोल बॅलन्स ठेवा';

  @override
  String get action_cortisol_subtitle =>
      'कमी कॅफीन, चांगली झोप. छोटे बदल, मोठा फरक.';

  @override
  String get action_adaptogens_title => 'नैसर्गिक अडॅप्टोजन वापरून बघा';

  @override
  String get action_adaptogens_subtitle =>
      'अश्वगंधा आणि तुळस तणावाशी लढायला मदत करतात.';

  @override
  String get wellness_tip_intro => 'सकाळी गरम हर्बल चहाने सुरुवात करा';

  @override
  String get wellness_tip_body => '— पोट फुगवट कमी होते आणि मन शांत राहते.';

  @override
  String get ask_ovya_anything => 'Ovya ला काहीही विचारा';

  @override
  String get report_generated_success => 'रिपोर्ट तयार आहे!';
}
