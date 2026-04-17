// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'ओव्या';

  @override
  String get logSymptoms => 'लक्षण दर्ज करें';

  @override
  String get howAreYouFeeling => 'आज आप कैसा महसूस कर रही हैं?';

  @override
  String get irregularCycle => 'अनियमित मासिक चक्र';

  @override
  String get acne => 'मुहांसे';

  @override
  String get weightGain => 'वजन बढ़ना';

  @override
  String get excessHairGrowth => 'अत्यधिक बाल उगना';

  @override
  String get moodIssues => 'मूड की समस्या';

  @override
  String get notesOptional => 'नोट्स (वैकल्पिक)';

  @override
  String get notesHint => 'कोई अतिरिक्त विवरण...';

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
  String get recommendations => 'सिफारिशें';

  @override
  String get aiInsights => 'AI अंतर्दृष्टि';

  @override
  String get generateInsight => 'अंतर्दृष्टि उत्पन्न करें';

  @override
  String get noInsightsYet => 'अभी तक कोई अंतर्दृष्टि नहीं';

  @override
  String get noInsightsDescription =>
      'पहले अपने लक्षण दर्ज करें, फिर\n\"अंतर्दृष्टि उत्पन्न करें\" पर टैप करें।';

  @override
  String get latestInsight => 'नवीनतम अंतर्दृष्टि';

  @override
  String get cached => 'कैश्ड';

  @override
  String get aiGenerated => 'AI द्वारा उत्पन्न';

  @override
  String get previousInsights => 'पिछली अंतर्दृष्टि';

  @override
  String get disclaimer =>
      'यह केवल सूचनात्मक है और चिकित्सा निदान नहीं है। कृपया स्वास्थ्य विशेषज्ञ से परामर्श करें।';

  @override
  String get clearCache => 'कैश साफ करें';

  @override
  String get viewInsights => 'अंतर्दृष्टि देखें';

  @override
  String get offlineModeActive => 'ऑफ़लाइन मोड सक्रिय';

  @override
  String get syncingData => 'डेटा सिंक हो रहा है…';

  @override
  String get syncedSuccessfully => 'सफलतापूर्वक सिंक हुआ';

  @override
  String get fetchingInsights => 'नई अंतर्दृष्टि प्राप्त हो रही है…';

  @override
  String get usingLastSaved => 'पिछली सहेजी गई अंतर्दृष्टि का उपयोग कर रहे हैं';

  @override
  String get offlineShowingLast =>
      'हम ऑफ़लाइन हैं। आपकी पिछली अंतर्दृष्टि दिखा रहे हैं।';

  @override
  String get failedToLoad => 'लोड करने में विफल';

  @override
  String get failedToAdd => 'जोड़ने में विफल';

  @override
  String get failedToGenerate => 'उत्पन्न करने में विफल';
}
