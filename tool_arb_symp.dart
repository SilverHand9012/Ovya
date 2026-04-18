import 'dart:convert';
import 'dart:io';

void main() {
  final l10nDir = Directory('lib/l10n');
  final files = l10nDir.listSync().whereType<File>().where((f) => f.path.endsWith('.arb'));

  final additions = {
    'en': {
      "hairThinning": "Hair Thinning",
      "skinDarkening": "Skin Darkening",
      "fatigue": "Fatigue",
      "sleepProblems": "Sleep Problems",
      "bloating": "Bloating"
    },
    'hi': {
      "hairThinning": "बालों का पतला होना",
      "skinDarkening": "त्वचा का काला पड़ना",
      "fatigue": "थकान",
      "sleepProblems": "नींद की समस्या",
      "bloating": "पेट फूलना"
    },
    'mr': {
      "hairThinning": "केस पातळ होणे",
      "skinDarkening": "त्वचा काळी पडणे",
      "fatigue": "थकवा",
      "sleepProblems": "झोपेची समस्या",
      "bloating": "पोट फुगणे"
    },
    'kn': {
      "hairThinning": "ಕೂದಲು ತೆಳುವಾಗುವುದು",
      "skinDarkening": "ಚರ್ಮ ಕಪ್ಪಾಗುವುದು",
      "fatigue": "ಆಯಾಸ",
      "sleepProblems": "ನಿದ್ರೆಯ ಸಮಸ್ಯೆಗಳು",
      "bloating": "ಹೊಟ್ಟೆ ಉಬ್ಬರ"
    },
    'te': {
      "hairThinning": "జుట్టు రాలడం",
      "skinDarkening": "చర్మం నల్లబడటం",
      "fatigue": "అలసట",
      "sleepProblems": "నిద్ర సమస్యలు",
      "bloating": "కడుపు ఉబ్బరం"
    }
  };

  for (var file in files) {
    var raw = file.readAsStringSync();
    var map = json.decode(raw) as Map<String, dynamic>;
    String loc = map['@@locale'] as String;
    var addMap = additions[loc];
    if (addMap != null) {
      addMap.forEach((k, v) {
        if (!map.containsKey(k)) map[k] = v;
      });
      final encoder = JsonEncoder.withIndent('  ');
      file.writeAsStringSync(encoder.convert(map));
      print('Updated \${file.path}');
    }
  }
}
