// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'ओव्या';

  @override
  String get logSymptoms => 'लक्षणे नोंदवा';

  @override
  String get howAreYouFeeling => 'आज तुम्हाला कसे वाटत आहे?';

  @override
  String get irregularCycle => 'अनियमित मासिक पाळी';

  @override
  String get acne => 'मुरुम';

  @override
  String get weightGain => 'वजन वाढणे';

  @override
  String get excessHairGrowth => 'अतिरिक्त केसांची वाढ';

  @override
  String get moodIssues => 'मूड समस्या';

  @override
  String get notesOptional => 'टिपा (पर्यायी)';

  @override
  String get notesHint => 'कोणतेही अतिरिक्त तपशील...';

  @override
  String get logSymptomsButton => 'लक्षणे नोंदवा';

  @override
  String get symptomsLoggedSuccess => 'लक्षणे यशस्वीपणे नोंदवली!';

  @override
  String get history => 'इतिहास';

  @override
  String get noSymptoms => 'कोणतीही लक्षणे नाहीत';

  @override
  String riskLevel(String level) {
    return 'जोखीम पातळी: $level';
  }

  @override
  String score(int value) {
    return 'गुण: $value';
  }

  @override
  String get recommendations => 'शिफारसी';

  @override
  String get aiInsights => 'AI अंतर्दृष्टी';

  @override
  String get generateInsight => 'अंतर्दृष्टी तयार करा';

  @override
  String get noInsightsYet => 'अद्याप कोणतीही अंतर्दृष्टी नाही';

  @override
  String get noInsightsDescription =>
      'प्रथम तुमची लक्षणे नोंदवा, नंतर\n\"अंतर्दृष्टी तयार करा\" वर टॅप करा.';

  @override
  String get latestInsight => 'नवीनतम अंतर्दृष्टी';

  @override
  String get cached => 'कॅश केलेले';

  @override
  String get aiGenerated => 'AI द्वारे तयार';

  @override
  String get previousInsights => 'मागील अंतर्दृष्टी';

  @override
  String get disclaimer =>
      'हे केवळ माहितीपूर्ण आहे आणि वैद्यकीय निदान नाही. कृपया आरोग्य व्यावसायिकांचा सल्ला घ्या.';

  @override
  String get clearCache => 'कॅश साफ करा';

  @override
  String get viewInsights => 'अंतर्दृष्टी पहा';

  @override
  String get offlineModeActive => 'ऑफलाइन मोड सक्रिय';

  @override
  String get syncingData => 'डेटा सिंक होत आहे…';

  @override
  String get syncedSuccessfully => 'यशस्वीपणे सिंक झाले';

  @override
  String get fetchingInsights => 'नवीन अंतर्दृष्टी मिळवत आहे…';

  @override
  String get usingLastSaved => 'शेवटची सेव्ह केलेली अंतर्दृष्टी वापरत आहे';

  @override
  String get offlineShowingLast =>
      'आम्ही ऑफलाइन आहोत. तुमची शेवटची अंतर्दृष्टी दाखवत आहोत.';

  @override
  String get failedToLoad => 'लोड करण्यात अयशस्वी';

  @override
  String get failedToAdd => 'जोडण्यात अयशस्वी';

  @override
  String get failedToGenerate => 'तयार करण्यात अयशस्वी';
}
