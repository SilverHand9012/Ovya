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

  @override
  String get rec_track_regularly =>
      'ముందస్తు గుర్తింపు కోసం మీ లక్షణాలను క్రమం తప్పకుండా నమోదు చేస్తూ ఉండండి.';

  @override
  String get rec_balanced_diet =>
      'సమతుల్య ఆహారం తీసుకోండి మరియు క్రమం తప్పకుండా వ్యాయామం చేయండి.';

  @override
  String get rec_schedule_checkup =>
      'మీ వైద్యునితో తనిఖీ కోసం సమయం తీసుకోవడం గురించి ఆలోచించండి.';

  @override
  String get rec_monitor_cycle =>
      'మీ ఋతుచక్రాన్ని దగ్గరగా గమనించండి మరియు ఏవైనా అసక్రమతలను నమోదు చేయండి.';

  @override
  String get rec_stress_management =>
      'యోగా లేదా ధ్యానం వంటి ఒత్తిడి నిర్వహణ పద్ధతులను అనుసరించండి.';

  @override
  String get rec_consult_gynecologist =>
      'దయచేసి వీలైనంత త్వరగా స్త్రీ వైద్య నిపుణులను సంప్రదించండి.';

  @override
  String get rec_request_bloodwork =>
      'హార్మోన్ ప్యానెల్ మరియు ఇన్సులిన్ స్థాయిలతో సహా రక్త పరీక్ష చేయించుకోండి.';

  @override
  String get rec_symptom_diary =>
      'మీ వైద్యునికి చూపించడానికి వివరమైన లక్షణాల డైరీ ఉంచండి.';
}
