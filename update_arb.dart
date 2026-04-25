import 'dart:convert';
import 'dart:io';

void main() async {
  final l10nDir = Directory('lib/l10n');
  final files = l10nDir.listSync().whereType<File>().where((f) => f.path.endsWith('.arb'));

  final additions = {
    'en': {
      "q_irregular_cycle": "Do you have irregular cycles?",
      "q_hair_growth": "Do you have excess body or facial hair?",
      "q_family_history": "Do you have a family history of PCOS?",
      "q_weight_gain": "Have you experienced unexplained weight gain?",
      "q_acne": "Do you struggle with severe acne?",
      "q_skin_darkening": "Do you have darkening of skin (e.g., around neck)?",
      "q_hair_thinning": "Are you experiencing hair thinning?",
      "q_fatigue": "Do you often feel unusually fatigued?",
      "q_sleep_problems": "Do you have trouble sleeping?",
      "q_bloating": "Do you frequently experience bloating?",
      "q_mood_issues": "Do you experience frequent mood swings?",
      "q_over_18": "Are you over 18 years old?",
      "q_difficulty_conceiving": "Are you having difficulty conceiving?",
      "trackCycle": "Track Cycle",
      "logPeriodDates": "Log your period dates"
    },
    'hi': {
      "q_irregular_cycle": "क्या आपके मासिक धर्म (पीरियड्स) अनियमित हैं?",
      "q_hair_growth": "क्या आपके चेहरे या शरीर पर अनचाहे बाल हैं?",
      "q_family_history": "क्या आपके परिवार में किसी को PCOS की समस्या है?",
      "q_weight_gain": "क्या आपका वजन बिना किसी कारण के बढ़ रहा है?",
      "q_acne": "क्या आपको गंभीर मुंहासों की समस्या है?",
      "q_skin_darkening": "क्या आपकी त्वचा (जैसे गर्दन के आसपास) काली पड़ रही है?",
      "q_hair_thinning": "क्या आपके बाल झड़ रहे हैं या पतले हो रहे हैं?",
      "q_fatigue": "क्या आपको अक्सर बहुत अधिक थकान महसूस होती है?",
      "q_sleep_problems": "क्या आपको सोने में परेशानी होती है?",
      "q_bloating": "क्या आपको अक्सर पेट फूलने की समस्या होती है?",
      "q_mood_issues": "क्या आपको अक्सर मूड स्विंग्स (मिज़ाज बदलना) की समस्या होती है?",
      "q_over_18": "क्या आपकी उम्र 18 वर्ष से अधिक है?",
      "q_difficulty_conceiving": "क्या आपको गर्भधारण करने में परेशानी हो रही है?",
      "trackCycle": "मासिक धर्म ट्रैक करें",
      "logPeriodDates": "अपने पीरियड्स की तारीखें दर्ज करें"
    },
    'kn': {
      "q_irregular_cycle": "ನಿಮಗೆ ಅನಿಯಮಿತ ಋತುಚಕ್ರವಿದೆಯೇ?",
      "q_hair_growth": "ನಿಮ್ಮ ಮುಖ ಅಥವಾ ದೇಹದ ಮೇಲೆ ಅನಗತ್ಯ ಕೂದಲು ಬೆಳೆಯುತ್ತಿದೆಯೇ?",
      "q_family_history": "ನಿಮ್ಮ ಕುಟುಂಬದಲ್ಲಿ ಯಾರಿಗಾದರೂ PCOS ಸಮಸ್ಯೆ ಇದೆಯೇ?",
      "q_weight_gain": "ಕಾರಣವಿಲ್ಲದೆ ನಿಮ್ಮ ತೂಕ ಹೆಚ್ಚಾಗುತ್ತಿದೆಯೇ?",
      "q_acne": "ನಿಮಗೆ ತೀವ್ರವಾದ ಮೊಡವೆಗಳ ಸಮಸ್ಯೆಯಿದೆಯೇ?",
      "q_skin_darkening": "ನಿಮ್ಮ ಚರ್ಮವು (ಉದಾಹರಣೆಗೆ ಕುತ್ತಿಗೆಯ ಸುತ್ತ) ಕಪ್ಪಾಗುತ್ತಿದೆಯೇ?",
      "q_hair_thinning": "ನಿಮ್ಮ ಕೂದಲು ಉದುರುತ್ತಿದೆಯೇ ಅಥವಾ ತೆಳುವಾಗುತ್ತಿದೆಯೇ?",
      "q_fatigue": "ನಿಮಗೆ ಆಗಾಗ್ಗೆ ಅತಿಯಾದ ಆಯಾಸವಾಗುತ್ತದೆಯೇ?",
      "q_sleep_problems": "ನಿಮಗೆ ನಿದ್ರಿಸಲು ತೊಂದರೆಯಾಗುತ್ತಿದೆಯೇ?",
      "q_bloating": "ನಿಮಗೆ ಆಗಾಗ್ಗೆ ಹೊಟ್ಟೆ ಉಬ್ಬರವಾಗುತ್ತದೆಯೇ?",
      "q_mood_issues": "ನಿಮಗೆ ಆಗಾಗ್ಗೆ ಮೂಡ್ ಸ್ವಿಂಗ್ (ಮನಸ್ಥಿತಿ ಬದಲಾವಣೆ) ಆಗುತ್ತದೆಯೇ?",
      "q_over_18": "ನಿಮಗೆ 18 ವರ್ಷಕ್ಕಿಂತ ಮೇಲ್ಪಟ್ಟ ವಯಸ್ಸಾಗಿದೆಯೇ?",
      "q_difficulty_conceiving": "ನಿಮಗೆ ಗರ್ಭಧರಿಸಲು ತೊಂದರೆಯಾಗುತ್ತಿದೆಯೇ?",
      "trackCycle": "ಋತುಚಕ್ರವನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ",
      "logPeriodDates": "ನಿಮ್ಮ ಋತುಚಕ್ರದ ದಿನಾಂಕಗಳನ್ನು ನಮೂದಿಸಿ"
    },
    'mr': {
      "q_irregular_cycle": "तुमची मासिक पाळी अनियमित आहे का?",
      "q_hair_growth": "तुमच्या चेहऱ्यावर किंवा शरीरावर नको असलेले केस आहेत का?",
      "q_family_history": "तुमच्या कुटुंबात कोणाला PCOS ची समस्या आहे का?",
      "q_weight_gain": "कोणत्याही कारणाशिवाय तुमचे वजन वाढत आहे का?",
      "q_acne": "तुम्हाला गंभीर मुरुमांचा त्रास आहे का?",
      "q_skin_darkening": "तुमची त्वचा (उदा. मानेभोवती) काळी पडतেলি आहे का?",
      "q_hair_thinning": "तुमचे केस गळत आहेत किंवा पातळ होत आहेत का?",
      "q_fatigue": "तुम्हाला वारंवार खूप थकवा जाणवतो का?",
      "q_sleep_problems": "तुम्हाला झोपायला त्रास होतो का?",
      "q_bloating": "तुम्हाला वारंवार पोट फुगल्यासारखे वाटते का?",
      "q_mood_issues": "तुमचा मूड वारंवार बदलतो (मूड स्विंग्स) का?",
      "q_over_18": "तुमचे वय १८ वर्षांपेक्षा जास्त आहे का?",
      "q_difficulty_conceiving": "तुम्हाला गर्भधारणा करण्यात अडचण येत आहे का?",
      "trackCycle": "मासिक पाळी ट्रॅक करा",
      "logPeriodDates": "तुमच्या पाळीच्या तारखा नोंदवा"
    },
    'te': {
      "q_irregular_cycle": "మీకు క్రమరహిత పీరియడ్స్ ఉన్నాయా?",
      "q_hair_growth": "మీ ముఖం లేదా శరీరంపై అవాంఛిత రోమాలు ఉన్నాయా?",
      "q_family_history": "మీ కుటుంబంలో ఎవరికైనా PCOS సమస్య ఉందా?",
      "q_weight_gain": "కారణం లేకుండా మీ బరువు పెరుగుతోందా?",
      "q_acne": "మీకు తీవ్రమైన మొటిమల సమస్య ఉందా?",
      "q_skin_darkening": "మీ చర్మం (ఉదాహరణకు మెడ చుట్టూ) నల్లబడుతోందా?",
      "q_hair_thinning": "మీ జుట్టు రాలిపోతోందా లేదా పలచబడుతోందా?",
      "q_fatigue": "మీరు తరచుగా చాలా అలసటగా భావిస్తారా?",
      "q_sleep_problems": "మీకు నిద్రపోవడంలో ఇబ్బంది ఉందా?",
      "q_bloating": "మీకు తరచుగా కడుపు ఉబ్బరంగా అనిపిస్తుందా?",
      "q_mood_issues": "మీకు తరచుగా మూడ్ స్వింగ్స్ (మానసిక స్థితిలో మార్పులు) వస్తున్నాయా?",
      "q_over_18": "మీకు 18 ఏళ్లు పైబడి ఉన్నాయా?",
      "q_difficulty_conceiving": "మీరు గర్భం దాల్చడంలో ఇబ్బంది పడుతున్నారా?",
      "trackCycle": "పీరియడ్స్ ట్రాక్ చేయండి",
      "logPeriodDates": "మీ పీరియడ్స్ తేదీలను నమోదు చేయండి"
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
      print('Updated ' + fileName);
    }
  }
}
