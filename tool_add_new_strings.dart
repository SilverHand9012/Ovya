import 'dart:convert';
import 'dart:io';

void main() async {
  final l10nDir = Directory('lib/l10n');
  final files = l10nDir.listSync().whereType<File>().where((f) => f.path.endsWith('.arb'));

  final additions = {
    'en': {
      "welcome_title": "Welcome to Ovya",
      "welcome_subtitle": "Let's understand your health better",
      "welcome_desc": "Answer a few simple questions to get personalized insights",
      "welcome_name_hint": "What should we call you?",
      "welcome_name_label": "Your name",
      "welcome_start_btn": "Start Assessment",
      "assessment_title": "ASSESSMENT",
      "assessment_help_text": "This helps us personalize your sanctuary space.",
      "btn_yes": "YES",
      "btn_no": "NO",
      "btn_next": "Next",
      "all_set_title": "You're all set",
      "all_set_subtitle": "Analyzing your responses...",
      "all_set_btn": "View Results",
      "all_set_footer": "Your data is safe in your sanctuary."
    },
    'hi': {
      "welcome_title": "Ovya में आपका स्वागत है",
      "welcome_subtitle": "आइए आपके स्वास्थ्य को बेहतर समझें",
      "welcome_desc": "व्यक्तिगत जानकारी प्राप्त करने के लिए कुछ आसान सवालों के जवाब दें",
      "welcome_name_hint": "हम आपको क्या कहकर बुलाएं?",
      "welcome_name_label": "आपका नाम",
      "welcome_start_btn": "मूल्यांकन शुरू करें",
      "assessment_title": "मूल्यांकन",
      "assessment_help_text": "यह हमें आपके स्थान को व्यक्तिगत बनाने में मदद करता है।",
      "btn_yes": "हाँ",
      "btn_no": "नहीं",
      "btn_next": "अगला",
      "all_set_title": "सब तैयार है",
      "all_set_subtitle": "आपकी प्रतिक्रियाओं का विश्लेषण हो रहा है...",
      "all_set_btn": "परिणाम देखें",
      "all_set_footer": "आपका डेटा आपके स्थान में सुरक्षित है।"
    },
    'kn': {
      "welcome_title": "Ovya ಗೆ ಸುಸ್ವಾಗತ",
      "welcome_subtitle": "ನಿಮ್ಮ ಆರೋಗ್ಯವನ್ನು ಉತ್ತಮವಾಗಿ ಅರ್ಥಮಾಡಿಕೊಳ್ಳೋಣ",
      "welcome_desc": "ವೈಯಕ್ತಿಕಗೊಳಿಸಿದ ಒಳನೋಟಗಳನ್ನು ಪಡೆಯಲು ಕೆಲವು ಸರಳ ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ",
      "welcome_name_hint": "ನಾವು ನಿಮ್ಮನ್ನು ಏನಂದು ಕರೆಯಬೇಕು?",
      "welcome_name_label": "ನಿಮ್ಮ ಹೆಸರು",
      "welcome_start_btn": "ಮೌಲ್ಯಮಾಪನ ಪ್ರಾರಂಭಿಸಿ",
      "assessment_title": "ಮೌಲ್ಯಮಾಪನ",
      "assessment_help_text": "ನಿಮ್ಮ ಸ್ಥಳವನ್ನು ವೈಯಕ್ತೀಕರಿಸಲು ಇದು ನಮಗೆ ಸಹಾಯ ಮಾಡುತ್ತದೆ.",
      "btn_yes": "ಹೌದು",
      "btn_no": "ಇಲ್ಲ",
      "btn_next": "ಮುಂದೆ",
      "all_set_title": "ಎಲ್ಲವೂ ಸಿದ್ಧವಾಗಿದೆ",
      "all_set_subtitle": "ನಿಮ್ಮ ಪ್ರತಿಕ್ರಿಯೆಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಲಾಗುತ್ತಿದೆ...",
      "all_set_btn": "ಫಲಿತಾಂಶಗಳನ್ನು ವೀಕ್ಷಿಸಿ",
      "all_set_footer": "ನಿಮ್ಮ ಡೇಟಾ ನಿಮ್ಮ ಸ್ಥಳದಲ್ಲಿ ಸುರಕ್ಷಿತವಾಗಿದೆ."
    },
    'mr': {
      "welcome_title": "Ovya मध्ये आपले स्वागत आहे",
      "welcome_subtitle": "चला आपले आरोग्य चांगले समजून घेऊया",
      "welcome_desc": "वैयक्तिकृत माहिती मिळविण्यासाठी काही सोप्या प्रश्नांची उत्तरे द्या",
      "welcome_name_hint": "आम्ही तुम्हाला काय म्हणावे?",
      "welcome_name_label": "तुमचे नाव",
      "welcome_start_btn": "मूल्यांकन सुरू करा",
      "assessment_title": "मूल्यांकन",
      "assessment_help_text": "हे आम्हाला तुमची जागा वैयक्तिकृत करण्यात मदत करते.",
      "btn_yes": "होय",
      "btn_no": "नाही",
      "btn_next": "पुढील",
      "all_set_title": "सर्व तयार आहे",
      "all_set_subtitle": "तुमच्या प्रतिसादांचे विश्लेषण करत आहे...",
      "all_set_btn": "निकाल पहा",
      "all_set_footer": "तुमचा डेटा तुमच्या जागेत सुरक्षित आहे."
    },
    'te': {
      "welcome_title": "Ovya కి స్వాగతం",
      "welcome_subtitle": "మీ ఆరోగ్యాన్ని మెరుగ్గా అర్థం చేసుకుందాం",
      "welcome_desc": "వ్యక్తిగతీకరించిన అంతర్దృష్టులను పొందడానికి కొన్ని సాధారణ ప్రశ్నలకు సమాధానం ఇవ్వండి",
      "welcome_name_hint": "మేము మిమ్మల్ని ఏమని పిలవాలి?",
      "welcome_name_label": "మీ పేరు",
      "welcome_start_btn": "అసెస్‌మెంట్ ప్రారంభించండి",
      "assessment_title": "అసెస్‌మెంట్",
      "assessment_help_text": "ఇది మీ స్థలాన్ని వ్యక్తిగతీకరించడంలో మాకు సహాయపడుతుంది.",
      "btn_yes": "అవును",
      "btn_no": "కాదు",
      "btn_next": "తరువాత",
      "all_set_title": "అంతా సిద్ధమైంది",
      "all_set_subtitle": "మీ ప్రతిస్పందనలను విశ్లేషిస్తున్నాము...",
      "all_set_btn": "ఫలితాలను చూడండి",
      "all_set_footer": "మీ డేటా మీ స్థలంలో సురక్షితంగా ఉంటుంది."
    }
  };

  for (var file in files) {
    final fileName = file.uri.pathSegments.last;
    final langCode = fileName.replaceAll('app_', '').replaceAll('.arb', '');
    
    if (additions.containsKey(langCode)) {
      final content = file.readAsStringSync();
      final map = jsonDecode(content) as Map<String, dynamic>;
      map.addAll(additions[langCode]!);
      
      const encoder = JsonEncoder.withIndent('  ');
      file.writeAsStringSync(encoder.convert(map));
      print('Updated \$fileName');
    }
  }
}
