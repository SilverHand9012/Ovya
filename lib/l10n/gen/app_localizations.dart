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

  /// No description provided for @greeting_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning,'**
  String get greeting_morning;

  /// No description provided for @synced_just_now.
  ///
  /// In en, this message translates to:
  /// **'SYNCED JUST NOW'**
  String get synced_just_now;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'SYNCING'**
  String get syncing;

  /// No description provided for @elevated_risk.
  ///
  /// In en, this message translates to:
  /// **'ELEVATED RISK'**
  String get elevated_risk;

  /// No description provided for @pcos_detected.
  ///
  /// In en, this message translates to:
  /// **'PCOS Flare-up Detected'**
  String get pcos_detected;

  /// No description provided for @review_assessment.
  ///
  /// In en, this message translates to:
  /// **'Review Assessment'**
  String get review_assessment;

  /// No description provided for @todays_focus.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Focus'**
  String get todays_focus;

  /// No description provided for @log_today.
  ///
  /// In en, this message translates to:
  /// **'Log today'**
  String get log_today;

  /// No description provided for @doctor_report.
  ///
  /// In en, this message translates to:
  /// **'Doctor report'**
  String get doctor_report;

  /// No description provided for @ask_ovya.
  ///
  /// In en, this message translates to:
  /// **'Ask Ovya'**
  String get ask_ovya;

  /// No description provided for @my_history.
  ///
  /// In en, this message translates to:
  /// **'My history'**
  String get my_history;

  /// No description provided for @mindful_moment.
  ///
  /// In en, this message translates to:
  /// **'Mindful Moment'**
  String get mindful_moment;

  /// No description provided for @results_title.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results_title;

  /// No description provided for @high_risk.
  ///
  /// In en, this message translates to:
  /// **'HIGH RISK'**
  String get high_risk;

  /// No description provided for @moderate_risk.
  ///
  /// In en, this message translates to:
  /// **'MODERATE RISK'**
  String get moderate_risk;

  /// No description provided for @low_risk.
  ///
  /// In en, this message translates to:
  /// **'LOW RISK'**
  String get low_risk;

  /// No description provided for @what_this_means.
  ///
  /// In en, this message translates to:
  /// **'What this means'**
  String get what_this_means;

  /// No description provided for @what_to_do_next.
  ///
  /// In en, this message translates to:
  /// **'WHAT TO DO NEXT'**
  String get what_to_do_next;

  /// No description provided for @generate_report.
  ///
  /// In en, this message translates to:
  /// **'Generate Detailed Report'**
  String get generate_report;

  /// No description provided for @continue_tracking.
  ///
  /// In en, this message translates to:
  /// **'Continue Tracking Symptoms'**
  String get continue_tracking;

  /// No description provided for @your_body_today.
  ///
  /// In en, this message translates to:
  /// **'Your {style_body} today'**
  String your_body_today(String style_body);

  /// No description provided for @energy_mood.
  ///
  /// In en, this message translates to:
  /// **'Energy & Mood'**
  String get energy_mood;

  /// No description provided for @symptoms_sensations.
  ///
  /// In en, this message translates to:
  /// **'Symptoms & Sensations'**
  String get symptoms_sensations;

  /// No description provided for @journal_notes.
  ///
  /// In en, this message translates to:
  /// **'JOURNAL NOTES'**
  String get journal_notes;

  /// No description provided for @journal_hint.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling mentally and physically? Any specific triggers today...'**
  String get journal_hint;

  /// No description provided for @take_a_breath.
  ///
  /// In en, this message translates to:
  /// **'Take a breath.'**
  String get take_a_breath;

  /// No description provided for @save_log.
  ///
  /// In en, this message translates to:
  /// **'Save Log'**
  String get save_log;

  /// No description provided for @symptom_headache.
  ///
  /// In en, this message translates to:
  /// **'Headache'**
  String get symptom_headache;

  /// No description provided for @symptom_cramps.
  ///
  /// In en, this message translates to:
  /// **'Cramps'**
  String get symptom_cramps;

  /// No description provided for @symptom_fatigue.
  ///
  /// In en, this message translates to:
  /// **'Fatigue'**
  String get symptom_fatigue;

  /// No description provided for @symptom_bloating.
  ///
  /// In en, this message translates to:
  /// **'Bloating'**
  String get symptom_bloating;

  /// No description provided for @symptom_nausea.
  ///
  /// In en, this message translates to:
  /// **'Nausea'**
  String get symptom_nausea;

  /// No description provided for @symptom_backache.
  ///
  /// In en, this message translates to:
  /// **'Backache'**
  String get symptom_backache;

  /// No description provided for @symptom_insomnia.
  ///
  /// In en, this message translates to:
  /// **'Insomnia'**
  String get symptom_insomnia;

  /// No description provided for @logout_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout_dialog_title;

  /// No description provided for @logout_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'You have {pendingCount} unsynced logs. If you log out, they might be lost. Are you sure?'**
  String logout_dialog_content(String pendingCount);

  /// No description provided for @logout_dialog_confirm.
  ///
  /// In en, this message translates to:
  /// **'Log Out Anyway'**
  String get logout_dialog_confirm;

  /// No description provided for @logout_dialog_stay.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get logout_dialog_stay;

  /// No description provided for @sync_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Sync Needed'**
  String get sync_dialog_title;

  /// No description provided for @sync_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'You have {pendingCount} offline logs. Would you like to sync them now?'**
  String sync_dialog_content(String pendingCount);

  /// No description provided for @discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncNow;

  /// No description provided for @auth_sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get auth_sign_in;

  /// No description provided for @auth_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get auth_sign_up;

  /// No description provided for @auth_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get auth_email;

  /// No description provided for @auth_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password;

  /// No description provided for @auth_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get auth_confirm_password;

  /// No description provided for @auth_error_passwords_no_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get auth_error_passwords_no_match;

  /// No description provided for @auth_create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get auth_create_account;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @chat_title.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat_title;

  /// No description provided for @chat_context_card.
  ///
  /// In en, this message translates to:
  /// **'Context: {level}'**
  String chat_context_card(String level);

  /// No description provided for @chat_offline_banner.
  ///
  /// In en, this message translates to:
  /// **'Offline mode'**
  String get chat_offline_banner;

  /// No description provided for @chat_disclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get chat_disclaimer;

  /// No description provided for @chat_suggested_title.
  ///
  /// In en, this message translates to:
  /// **'Suggested'**
  String get chat_suggested_title;

  /// No description provided for @chat_suggestion_1.
  ///
  /// In en, this message translates to:
  /// **'Suggestion 1'**
  String get chat_suggestion_1;

  /// No description provided for @chat_suggestion_2.
  ///
  /// In en, this message translates to:
  /// **'Suggestion 2'**
  String get chat_suggestion_2;

  /// No description provided for @chat_suggestion_3.
  ///
  /// In en, this message translates to:
  /// **'Suggestion 3'**
  String get chat_suggestion_3;

  /// No description provided for @chat_offline_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get chat_offline_tooltip;

  /// No description provided for @chat_input_hint.
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get chat_input_hint;

  /// No description provided for @btn_generate_report.
  ///
  /// In en, this message translates to:
  /// **'Generate Report'**
  String get btn_generate_report;

  /// No description provided for @report_offline_note.
  ///
  /// In en, this message translates to:
  /// **'Offline Note'**
  String get report_offline_note;

  /// No description provided for @report_patient_name.
  ///
  /// In en, this message translates to:
  /// **'Patient Name'**
  String get report_patient_name;

  /// No description provided for @report_preview_title.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get report_preview_title;

  /// No description provided for @report_share_btn.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get report_share_btn;

  /// No description provided for @report_print_btn.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get report_print_btn;

  /// No description provided for @pdfTitle.
  ///
  /// In en, this message translates to:
  /// **'PDF Title'**
  String get pdfTitle;

  /// No description provided for @pdfDateGenerated.
  ///
  /// In en, this message translates to:
  /// **'Generated on {dateStr}'**
  String pdfDateGenerated(String dateStr);

  /// No description provided for @pdfDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get pdfDisclaimer;

  /// No description provided for @pdfGeneratedBy.
  ///
  /// In en, this message translates to:
  /// **'Generated by'**
  String get pdfGeneratedBy;

  /// No description provided for @patientDetails.
  ///
  /// In en, this message translates to:
  /// **'Patient Details'**
  String get patientDetails;

  /// No description provided for @patientNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name: {patientName}'**
  String patientNameLabel(String patientName);

  /// No description provided for @reportDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date: {nowStr}'**
  String reportDateLabel(String nowStr);

  /// No description provided for @riskAssessment.
  ///
  /// In en, this message translates to:
  /// **'Risk Assessment'**
  String get riskAssessment;

  /// No description provided for @riskLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Risk Level'**
  String get riskLevelLabel;

  /// No description provided for @scoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get scoreLabel;

  /// No description provided for @pcosTypeHintLabel.
  ///
  /// In en, this message translates to:
  /// **'PCOS Type Hint'**
  String get pcosTypeHintLabel;

  /// No description provided for @pcos_type_hint.
  ///
  /// In en, this message translates to:
  /// **'Hint: {hint}'**
  String pcos_type_hint(String hint);

  /// No description provided for @explanationLabel.
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get explanationLabel;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @symptomsLast30Days.
  ///
  /// In en, this message translates to:
  /// **'Symptoms in last 30 days'**
  String get symptomsLast30Days;

  /// No description provided for @noSymptoms30Days.
  ///
  /// In en, this message translates to:
  /// **'No symptoms in last 30 days'**
  String get noSymptoms30Days;

  /// No description provided for @tableHeaderDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get tableHeaderDate;

  /// No description provided for @tableHeaderSymptoms.
  ///
  /// In en, this message translates to:
  /// **'Symptoms'**
  String get tableHeaderSymptoms;

  /// No description provided for @tableHeaderMood.
  ///
  /// In en, this message translates to:
  /// **'Mood'**
  String get tableHeaderMood;

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

  /// No description provided for @hairThinning.
  ///
  /// In en, this message translates to:
  /// **'Hair Thinning'**
  String get hairThinning;

  /// No description provided for @skinDarkening.
  ///
  /// In en, this message translates to:
  /// **'Skin Darkening'**
  String get skinDarkening;

  /// No description provided for @fatigue.
  ///
  /// In en, this message translates to:
  /// **'Fatigue'**
  String get fatigue;

  /// No description provided for @sleepProblems.
  ///
  /// In en, this message translates to:
  /// **'Sleep Problems'**
  String get sleepProblems;

  /// No description provided for @bloating.
  ///
  /// In en, this message translates to:
  /// **'Bloating'**
  String get bloating;

  /// No description provided for @tableNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get tableNone;

  /// No description provided for @rec_track_regularly.
  ///
  /// In en, this message translates to:
  /// **'Track regularly'**
  String get rec_track_regularly;

  /// No description provided for @rec_balanced_diet.
  ///
  /// In en, this message translates to:
  /// **'Balanced diet'**
  String get rec_balanced_diet;

  /// No description provided for @rec_schedule_checkup.
  ///
  /// In en, this message translates to:
  /// **'Schedule checkup'**
  String get rec_schedule_checkup;

  /// No description provided for @rec_monitor_cycle.
  ///
  /// In en, this message translates to:
  /// **'Monitor cycle'**
  String get rec_monitor_cycle;

  /// No description provided for @rec_stress_management.
  ///
  /// In en, this message translates to:
  /// **'Stress management'**
  String get rec_stress_management;

  /// No description provided for @rec_consult_gynecologist.
  ///
  /// In en, this message translates to:
  /// **'Consult gynecologist'**
  String get rec_consult_gynecologist;

  /// No description provided for @rec_request_bloodwork.
  ///
  /// In en, this message translates to:
  /// **'Request bloodwork'**
  String get rec_request_bloodwork;

  /// No description provided for @rec_symptom_diary.
  ///
  /// In en, this message translates to:
  /// **'Symptom diary'**
  String get rec_symptom_diary;

  /// No description provided for @type_insulin_resistant.
  ///
  /// In en, this message translates to:
  /// **'Insulin Resistant'**
  String get type_insulin_resistant;

  /// No description provided for @type_androgenic.
  ///
  /// In en, this message translates to:
  /// **'Androgenic'**
  String get type_androgenic;

  /// No description provided for @type_adrenal.
  ///
  /// In en, this message translates to:
  /// **'Adrenal'**
  String get type_adrenal;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;
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
