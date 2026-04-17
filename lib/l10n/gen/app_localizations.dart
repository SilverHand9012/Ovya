import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('kn'),
    Locale('mr'),
    Locale('te')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ovya'**
  String get appTitle;

  /// No description provided for @logSymptoms.
  ///
  /// In en, this message translates to:
  /// **'Log Symptoms'**
  String get logSymptoms;

  /// No description provided for @howAreYouFeeling.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get howAreYouFeeling;

  /// No description provided for @irregularCycle.
  ///
  /// In en, this message translates to:
  /// **'Irregular Cycle'**
  String get irregularCycle;

  /// No description provided for @acne.
  ///
  /// In en, this message translates to:
  /// **'Acne'**
  String get acne;

  /// No description provided for @weightGain.
  ///
  /// In en, this message translates to:
  /// **'Weight Gain'**
  String get weightGain;

  /// No description provided for @excessHairGrowth.
  ///
  /// In en, this message translates to:
  /// **'Excess Hair Growth'**
  String get excessHairGrowth;

  /// No description provided for @moodIssues.
  ///
  /// In en, this message translates to:
  /// **'Mood Issues'**
  String get moodIssues;

  /// No description provided for @notesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get notesOptional;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Any additional details...'**
  String get notesHint;

  /// No description provided for @logSymptomsButton.
  ///
  /// In en, this message translates to:
  /// **'Log Symptoms'**
  String get logSymptomsButton;

  /// No description provided for @symptomsLoggedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Symptoms logged successfully!'**
  String get symptomsLoggedSuccess;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @noSymptoms.
  ///
  /// In en, this message translates to:
  /// **'No symptoms'**
  String get noSymptoms;

  /// No description provided for @riskLevel.
  ///
  /// In en, this message translates to:
  /// **'Risk Level: {level}'**
  String riskLevel(String level);

  /// No description provided for @score.
  ///
  /// In en, this message translates to:
  /// **'Score: {value}'**
  String score(int value);

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @aiInsights.
  ///
  /// In en, this message translates to:
  /// **'AI Insights'**
  String get aiInsights;

  /// No description provided for @generateInsight.
  ///
  /// In en, this message translates to:
  /// **'Generate Insight'**
  String get generateInsight;

  /// No description provided for @noInsightsYet.
  ///
  /// In en, this message translates to:
  /// **'No insights yet'**
  String get noInsightsYet;

  /// No description provided for @noInsightsDescription.
  ///
  /// In en, this message translates to:
  /// **'Log your symptoms first, then tap\n\"Generate Insight\" for personalised advice.'**
  String get noInsightsDescription;

  /// No description provided for @latestInsight.
  ///
  /// In en, this message translates to:
  /// **'Latest Insight'**
  String get latestInsight;

  /// No description provided for @cached.
  ///
  /// In en, this message translates to:
  /// **'Cached'**
  String get cached;

  /// No description provided for @aiGenerated.
  ///
  /// In en, this message translates to:
  /// **'AI Generated'**
  String get aiGenerated;

  /// No description provided for @previousInsights.
  ///
  /// In en, this message translates to:
  /// **'Previous Insights'**
  String get previousInsights;

  /// No description provided for @disclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is informational only and not a medical diagnosis. Please consult a healthcare professional.'**
  String get disclaimer;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get clearCache;

  /// No description provided for @viewInsights.
  ///
  /// In en, this message translates to:
  /// **'View Insights'**
  String get viewInsights;

  /// No description provided for @offlineModeActive.
  ///
  /// In en, this message translates to:
  /// **'Offline mode active'**
  String get offlineModeActive;

  /// No description provided for @syncingData.
  ///
  /// In en, this message translates to:
  /// **'Syncing data…'**
  String get syncingData;

  /// No description provided for @syncedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Synced successfully'**
  String get syncedSuccessfully;

  /// No description provided for @fetchingInsights.
  ///
  /// In en, this message translates to:
  /// **'Fetching new insights…'**
  String get fetchingInsights;

  /// No description provided for @usingLastSaved.
  ///
  /// In en, this message translates to:
  /// **'Using last saved insights'**
  String get usingLastSaved;

  /// No description provided for @offlineShowingLast.
  ///
  /// In en, this message translates to:
  /// **'We\'re offline. Showing your last insights.'**
  String get offlineShowingLast;

  /// No description provided for @failedToLoad.
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get failedToLoad;

  /// No description provided for @failedToAdd.
  ///
  /// In en, this message translates to:
  /// **'Failed to add'**
  String get failedToAdd;

  /// No description provided for @failedToGenerate.
  ///
  /// In en, this message translates to:
  /// **'Failed to generate'**
  String get failedToGenerate;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'kn', 'mr', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'kn':
      return AppLocalizationsKn();
    case 'mr':
      return AppLocalizationsMr();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
