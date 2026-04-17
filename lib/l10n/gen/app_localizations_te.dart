// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'ఓవ్యా';

  @override
  String get logSymptoms => 'లక్షణాలు నమోదు చేయండి';

  @override
  String get howAreYouFeeling => 'ఈ రోజు మీకు ఎలా అనిపిస్తోంది?';

  @override
  String get irregularCycle => 'అసక్రమ ఋతుచక్రం';

  @override
  String get acne => 'మొటిమలు';

  @override
  String get weightGain => 'బరువు పెరుగుట';

  @override
  String get excessHairGrowth => 'అధిక వెంట్రుకల పెరుగుదల';

  @override
  String get moodIssues => 'మానసిక స్థితి సమస్యలు';

  @override
  String get notesOptional => 'గమనికలు (ఐచ్ఛికం)';

  @override
  String get notesHint => 'ఏదైనా అదనపు వివరాలు...';

  @override
  String get logSymptomsButton => 'లక్షణాలు నమోదు చేయండి';

  @override
  String get symptomsLoggedSuccess => 'లక్షణాలు విజయవంతంగా నమోదు చేయబడ్డాయి!';

  @override
  String get history => 'చరిత్ర';

  @override
  String get noSymptoms => 'లక్షణాలు లేవు';

  @override
  String riskLevel(String level) {
    return 'ప్రమాద స్థాయి: $level';
  }

  @override
  String score(int value) {
    return 'స్కోర్: $value';
  }

  @override
  String get recommendations => 'సిఫారసులు';

  @override
  String get aiInsights => 'AI అంతర్దృష్టులు';

  @override
  String get generateInsight => 'అంతర్దృష్టి సృష్టించండి';

  @override
  String get noInsightsYet => 'ఇంకా అంతర్దృష్టులు లేవు';

  @override
  String get noInsightsDescription =>
      'ముందుగా మీ లక్షణాలను నమోదు చేయండి, తర్వాత\n\"అంతర్దృష్టి సృష్టించండి\" నొక్కండి.';

  @override
  String get latestInsight => 'తాజా అంతర్దృష్టి';

  @override
  String get cached => 'కాష్ చేయబడింది';

  @override
  String get aiGenerated => 'AI ద్వారా సృష్టించబడింది';

  @override
  String get previousInsights => 'మునుపటి అంతర్దృష్టులు';

  @override
  String get disclaimer =>
      'ఇది సమాచార ప్రయోజనాల కోసం మాత్రమే మరియు వైద్య నిర్ధారణ కాదు. దయచేసి ఆరోగ్య నిపుణులను సంప్రదించండి.';

  @override
  String get clearCache => 'కాష్ క్లియర్ చేయండి';

  @override
  String get viewInsights => 'అంతర్దృష్టులు చూడండి';

  @override
  String get offlineModeActive => 'ఆఫ్‌లైన్ మోడ్ యాక్టివ్';

  @override
  String get syncingData => 'డేటా సింక్ అవుతోంది…';

  @override
  String get syncedSuccessfully => 'విజయవంతంగా సింక్ అయింది';

  @override
  String get fetchingInsights => 'కొత్త అంతర్దృష్టులు పొందుతోంది…';

  @override
  String get usingLastSaved =>
      'చివరిగా సేవ్ చేసిన అంతర్దృష్టులను ఉపయోగిస్తోంది';

  @override
  String get offlineShowingLast =>
      'మేము ఆఫ్‌లైన్‌లో ఉన్నాము. మీ చివరి అంతర్దృష్టులను చూపిస్తున్నాము.';

  @override
  String get failedToLoad => 'లోడ్ చేయడం విఫలమైంది';

  @override
  String get failedToAdd => 'జోడించడం విఫలమైంది';

  @override
  String get failedToGenerate => 'సృష్టించడం విఫలమైంది';
}
