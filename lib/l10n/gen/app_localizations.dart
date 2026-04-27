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
  /// **'ALL SYNCED'**
  String get synced_just_now;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'SYNCING...'**
  String get syncing;

  /// No description provided for @elevated_risk.
  ///
  /// In en, this message translates to:
  /// **'NEEDS ATTENTION'**
  String get elevated_risk;

  /// No description provided for @pcos_detected.
  ///
  /// In en, this message translates to:
  /// **'Your body is showing signs'**
  String get pcos_detected;

  /// No description provided for @review_assessment.
  ///
  /// In en, this message translates to:
  /// **'See what\'s going on'**
  String get review_assessment;

  /// No description provided for @todays_focus.
  ///
  /// In en, this message translates to:
  /// **'Your Day'**
  String get todays_focus;

  /// No description provided for @log_today.
  ///
  /// In en, this message translates to:
  /// **'How are you today?'**
  String get log_today;

  /// No description provided for @doctor_report.
  ///
  /// In en, this message translates to:
  /// **'Doctor report'**
  String get doctor_report;

  /// No description provided for @ask_ovya.
  ///
  /// In en, this message translates to:
  /// **'Talk to Ovya'**
  String get ask_ovya;

  /// No description provided for @my_history.
  ///
  /// In en, this message translates to:
  /// **'My Journey'**
  String get my_history;

  /// No description provided for @mindful_moment.
  ///
  /// In en, this message translates to:
  /// **'A Moment for You'**
  String get mindful_moment;

  /// No description provided for @results_title.
  ///
  /// In en, this message translates to:
  /// **'Your Insights'**
  String get results_title;

  /// No description provided for @results_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s what your body is telling us'**
  String get results_subtitle;

  /// No description provided for @high_risk.
  ///
  /// In en, this message translates to:
  /// **'HIGH'**
  String get high_risk;

  /// No description provided for @moderate_risk.
  ///
  /// In en, this message translates to:
  /// **'MODERATE'**
  String get moderate_risk;

  /// No description provided for @low_risk.
  ///
  /// In en, this message translates to:
  /// **'LOW'**
  String get low_risk;

  /// No description provided for @what_this_means.
  ///
  /// In en, this message translates to:
  /// **'What this means for you'**
  String get what_this_means;

  /// No description provided for @what_to_do_next.
  ///
  /// In en, this message translates to:
  /// **'SMALL STEPS THAT HELP'**
  String get what_to_do_next;

  /// No description provided for @generate_report.
  ///
  /// In en, this message translates to:
  /// **'Create a detailed report'**
  String get generate_report;

  /// No description provided for @continue_tracking.
  ///
  /// In en, this message translates to:
  /// **'Keep tracking your symptoms'**
  String get continue_tracking;

  /// No description provided for @your_body_today.
  ///
  /// In en, this message translates to:
  /// **'Your {style_body} today'**
  String your_body_today(String style_body);

  /// No description provided for @energy_mood.
  ///
  /// In en, this message translates to:
  /// **'How\'s your energy?'**
  String get energy_mood;

  /// No description provided for @symptoms_sensations.
  ///
  /// In en, this message translates to:
  /// **'What are you feeling?'**
  String get symptoms_sensations;

  /// No description provided for @journal_notes.
  ///
  /// In en, this message translates to:
  /// **'YOUR NOTES'**
  String get journal_notes;

  /// No description provided for @journal_hint.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today? Anything on your mind...'**
  String get journal_hint;

  /// No description provided for @take_a_breath.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing great. Take a breath.'**
  String get take_a_breath;

  /// No description provided for @save_log.
  ///
  /// In en, this message translates to:
  /// **'Save'**
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
  /// **'Tired'**
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
  /// **'Back pain'**
  String get symptom_backache;

  /// No description provided for @symptom_insomnia.
  ///
  /// In en, this message translates to:
  /// **'Can\'t sleep'**
  String get symptom_insomnia;

  /// No description provided for @logout_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Leaving so soon?'**
  String get logout_dialog_title;

  /// No description provided for @logout_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'You have {pendingCount} entries that haven\'t synced yet. They might be lost if you log out now.'**
  String logout_dialog_content(String pendingCount);

  /// No description provided for @logout_dialog_confirm.
  ///
  /// In en, this message translates to:
  /// **'Log out anyway'**
  String get logout_dialog_confirm;

  /// No description provided for @logout_dialog_stay.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get logout_dialog_stay;

  /// No description provided for @sync_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Time to sync'**
  String get sync_dialog_title;

  /// No description provided for @sync_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'You have {pendingCount} entries saved offline. Want to sync them now?'**
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
  /// **'Sync now'**
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
  /// **'Confirm password'**
  String get auth_confirm_password;

  /// No description provided for @auth_error_passwords_no_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
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
  /// **'You\'re offline right now'**
  String get chat_offline_banner;

  /// No description provided for @chat_disclaimer.
  ///
  /// In en, this message translates to:
  /// **'For awareness, not diagnosis'**
  String get chat_disclaimer;

  /// No description provided for @chat_suggested_title.
  ///
  /// In en, this message translates to:
  /// **'Try asking'**
  String get chat_suggested_title;

  /// No description provided for @chat_suggestion_1.
  ///
  /// In en, this message translates to:
  /// **'How can I sleep better?'**
  String get chat_suggestion_1;

  /// No description provided for @chat_suggestion_2.
  ///
  /// In en, this message translates to:
  /// **'Tips for managing stress'**
  String get chat_suggestion_2;

  /// No description provided for @chat_suggestion_3.
  ///
  /// In en, this message translates to:
  /// **'What should I eat today?'**
  String get chat_suggestion_3;

  /// No description provided for @chat_offline_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get chat_offline_tooltip;

  /// No description provided for @chat_input_hint.
  ///
  /// In en, this message translates to:
  /// **'Type something...'**
  String get chat_input_hint;

  /// No description provided for @btn_generate_report.
  ///
  /// In en, this message translates to:
  /// **'Generate Report'**
  String get btn_generate_report;

  /// No description provided for @report_offline_note.
  ///
  /// In en, this message translates to:
  /// **'Your report is created locally. Nothing leaves your phone.'**
  String get report_offline_note;

  /// No description provided for @report_patient_name.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get report_patient_name;

  /// No description provided for @report_preview_title.
  ///
  /// In en, this message translates to:
  /// **'What\'s in the report'**
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
  /// **'Ovya Health Report'**
  String get pdfTitle;

  /// No description provided for @pdfDateGenerated.
  ///
  /// In en, this message translates to:
  /// **'Created on {dateStr}'**
  String pdfDateGenerated(String dateStr);

  /// No description provided for @pdfDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This report is for informational purposes only and does not replace medical advice.'**
  String get pdfDisclaimer;

  /// No description provided for @pdfGeneratedBy.
  ///
  /// In en, this message translates to:
  /// **'Generated by Ovya'**
  String get pdfGeneratedBy;

  /// No description provided for @patientDetails.
  ///
  /// In en, this message translates to:
  /// **'About You'**
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
  /// **'Risk Overview'**
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
  /// **'PCOS Pattern'**
  String get pcosTypeHintLabel;

  /// No description provided for @pcos_type_hint.
  ///
  /// In en, this message translates to:
  /// **'Pattern: {hint}'**
  String pcos_type_hint(String hint);

  /// No description provided for @explanationLabel.
  ///
  /// In en, this message translates to:
  /// **'What it means'**
  String get explanationLabel;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'What you can do'**
  String get recommendations;

  /// No description provided for @symptomsLast30Days.
  ///
  /// In en, this message translates to:
  /// **'Your symptoms — last 30 days'**
  String get symptomsLast30Days;

  /// No description provided for @noSymptoms30Days.
  ///
  /// In en, this message translates to:
  /// **'No symptoms logged in the last 30 days'**
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
  /// **'Irregular periods'**
  String get irregularCycle;

  /// No description provided for @acne.
  ///
  /// In en, this message translates to:
  /// **'Acne'**
  String get acne;

  /// No description provided for @weightGain.
  ///
  /// In en, this message translates to:
  /// **'Weight changes'**
  String get weightGain;

  /// No description provided for @excessHairGrowth.
  ///
  /// In en, this message translates to:
  /// **'Excess hair growth'**
  String get excessHairGrowth;

  /// No description provided for @moodIssues.
  ///
  /// In en, this message translates to:
  /// **'Mood swings'**
  String get moodIssues;

  /// No description provided for @hairThinning.
  ///
  /// In en, this message translates to:
  /// **'Hair thinning'**
  String get hairThinning;

  /// No description provided for @skinDarkening.
  ///
  /// In en, this message translates to:
  /// **'Skin darkening'**
  String get skinDarkening;

  /// No description provided for @fatigue.
  ///
  /// In en, this message translates to:
  /// **'Fatigue'**
  String get fatigue;

  /// No description provided for @sleepProblems.
  ///
  /// In en, this message translates to:
  /// **'Sleep trouble'**
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
  /// **'Keep tracking regularly'**
  String get rec_track_regularly;

  /// No description provided for @rec_balanced_diet.
  ///
  /// In en, this message translates to:
  /// **'Eat balanced meals'**
  String get rec_balanced_diet;

  /// No description provided for @rec_schedule_checkup.
  ///
  /// In en, this message translates to:
  /// **'Schedule a check-up'**
  String get rec_schedule_checkup;

  /// No description provided for @rec_monitor_cycle.
  ///
  /// In en, this message translates to:
  /// **'Keep an eye on your cycle'**
  String get rec_monitor_cycle;

  /// No description provided for @rec_stress_management.
  ///
  /// In en, this message translates to:
  /// **'Find ways to de-stress'**
  String get rec_stress_management;

  /// No description provided for @rec_consult_gynecologist.
  ///
  /// In en, this message translates to:
  /// **'Talk to a gynaecologist'**
  String get rec_consult_gynecologist;

  /// No description provided for @rec_request_bloodwork.
  ///
  /// In en, this message translates to:
  /// **'Consider a blood test'**
  String get rec_request_bloodwork;

  /// No description provided for @rec_symptom_diary.
  ///
  /// In en, this message translates to:
  /// **'Maintain a symptom diary'**
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

  /// No description provided for @your_body_prefix.
  ///
  /// In en, this message translates to:
  /// **'Your '**
  String get your_body_prefix;

  /// No description provided for @your_body_word.
  ///
  /// In en, this message translates to:
  /// **'body'**
  String get your_body_word;

  /// No description provided for @your_body_suffix.
  ///
  /// In en, this message translates to:
  /// **' today'**
  String get your_body_suffix;

  /// No description provided for @mindful_ashwagandha_title.
  ///
  /// In en, this message translates to:
  /// **'Ashwagandha Tea'**
  String get mindful_ashwagandha_title;

  /// No description provided for @mindful_ashwagandha_desc.
  ///
  /// In en, this message translates to:
  /// **'Helps calm your mind and bring your hormones into balance.'**
  String get mindful_ashwagandha_desc;

  /// No description provided for @chat_ask_ovya_title.
  ///
  /// In en, this message translates to:
  /// **'Talk to Ovya'**
  String get chat_ask_ovya_title;

  /// No description provided for @chat_personal_guide.
  ///
  /// In en, this message translates to:
  /// **'YOUR WELLNESS BUDDY'**
  String get chat_personal_guide;

  /// No description provided for @chat_wellness_sanctuary.
  ///
  /// In en, this message translates to:
  /// **'Your\nSafe\nSpace'**
  String get chat_wellness_sanctuary;

  /// No description provided for @chat_wellness_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Gentle guidance shaped around your unique rhythm.'**
  String get chat_wellness_subtitle;

  /// No description provided for @chat_ovya_label.
  ///
  /// In en, this message translates to:
  /// **'OVYA'**
  String get chat_ovya_label;

  /// No description provided for @chat_greeting.
  ///
  /// In en, this message translates to:
  /// **'Hey! I noticed your sleep has been a bit off this week. Want some gentle tips to help you rest better?'**
  String get chat_greeting;

  /// No description provided for @chat_thinking.
  ///
  /// In en, this message translates to:
  /// **'Thinking...'**
  String get chat_thinking;

  /// No description provided for @chat_chip_sleep.
  ///
  /// In en, this message translates to:
  /// **'SLEEP'**
  String get chat_chip_sleep;

  /// No description provided for @chat_chip_stress.
  ///
  /// In en, this message translates to:
  /// **'STRESS'**
  String get chat_chip_stress;

  /// No description provided for @chat_chip_hormonal.
  ///
  /// In en, this message translates to:
  /// **'HORMONES'**
  String get chat_chip_hormonal;

  /// No description provided for @chat_chip_diet.
  ///
  /// In en, this message translates to:
  /// **'FOOD'**
  String get chat_chip_diet;

  /// No description provided for @chat_input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Tell me how you\'re feeling...'**
  String get chat_input_placeholder;

  /// No description provided for @chat_companion_note.
  ///
  /// In en, this message translates to:
  /// **'OVYA IS YOUR COMPANION, NOT A DOCTOR.'**
  String get chat_companion_note;

  /// No description provided for @chat_suggest_sleep.
  ///
  /// In en, this message translates to:
  /// **'Help me sleep better'**
  String get chat_suggest_sleep;

  /// No description provided for @chat_suggest_stress.
  ///
  /// In en, this message translates to:
  /// **'How do I manage stress with PCOS?'**
  String get chat_suggest_stress;

  /// No description provided for @chat_suggest_hormonal.
  ///
  /// In en, this message translates to:
  /// **'Tips for hormonal balance'**
  String get chat_suggest_hormonal;

  /// No description provided for @chat_suggest_diet.
  ///
  /// In en, this message translates to:
  /// **'What should I eat for PCOS?'**
  String get chat_suggest_diet;

  /// No description provided for @report_preview_demographics.
  ///
  /// In en, this message translates to:
  /// **'Your details and report date'**
  String get report_preview_demographics;

  /// No description provided for @report_preview_risk.
  ///
  /// In en, this message translates to:
  /// **'Risk score and PCOS pattern'**
  String get report_preview_risk;

  /// No description provided for @report_preview_logs.
  ///
  /// In en, this message translates to:
  /// **'30-day symptom overview'**
  String get report_preview_logs;

  /// No description provided for @report_preview_recs.
  ///
  /// In en, this message translates to:
  /// **'Personalised suggestions'**
  String get report_preview_recs;

  /// No description provided for @report_enter_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get report_enter_name;

  /// No description provided for @log_saved.
  ///
  /// In en, this message translates to:
  /// **'Saved! You\'re doing great ✓'**
  String get log_saved;

  /// No description provided for @no_risk_data.
  ///
  /// In en, this message translates to:
  /// **'No data yet. Log your symptoms first to see insights.'**
  String get no_risk_data;

  /// No description provided for @history_title.
  ///
  /// In en, this message translates to:
  /// **'My Journey'**
  String get history_title;

  /// No description provided for @history_recent_assessments.
  ///
  /// In en, this message translates to:
  /// **'Recent Check-ins'**
  String get history_recent_assessments;

  /// No description provided for @history_daily_logs.
  ///
  /// In en, this message translates to:
  /// **'Daily Logs'**
  String get history_daily_logs;

  /// No description provided for @history_no_assessments.
  ///
  /// In en, this message translates to:
  /// **'No check-ins yet. Start logging to see how you\'re doing!'**
  String get history_no_assessments;

  /// No description provided for @history_no_logs.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet. Start tracking to build your story.'**
  String get history_no_logs;

  /// No description provided for @history_general_profile.
  ///
  /// In en, this message translates to:
  /// **'General Profile'**
  String get history_general_profile;

  /// No description provided for @history_no_symptoms_tag.
  ///
  /// In en, this message translates to:
  /// **'NO SYMPTOMS LOGGED'**
  String get history_no_symptoms_tag;

  /// No description provided for @analysis_complete.
  ///
  /// In en, this message translates to:
  /// **'YOUR RESULTS ARE READY'**
  String get analysis_complete;

  /// No description provided for @insulin_resistant_pcos_indicator.
  ///
  /// In en, this message translates to:
  /// **'Insulin-Resistant Pattern'**
  String get insulin_resistant_pcos_indicator;

  /// No description provided for @androgenic_pcos_indicator.
  ///
  /// In en, this message translates to:
  /// **'Androgenic Pattern'**
  String get androgenic_pcos_indicator;

  /// No description provided for @adrenal_pcos_indicator.
  ///
  /// In en, this message translates to:
  /// **'Adrenal Pattern'**
  String get adrenal_pcos_indicator;

  /// No description provided for @general_pcos_indicator.
  ///
  /// In en, this message translates to:
  /// **'General Pattern'**
  String get general_pcos_indicator;

  /// No description provided for @hormonal_imbalance_detected.
  ///
  /// In en, this message translates to:
  /// **'We noticed some hormonal shifts'**
  String get hormonal_imbalance_detected;

  /// No description provided for @risk_explanation_high.
  ///
  /// In en, this message translates to:
  /// **'Based on what you\'ve shared — fatigue, irregular periods, and other signs — your body might be going through some hormonal changes. This is common and manageable.'**
  String get risk_explanation_high;

  /// No description provided for @risk_explanation_medium.
  ///
  /// In en, this message translates to:
  /// **'Some of your symptoms show patterns worth keeping an eye on. Regular tracking will help us understand better.'**
  String get risk_explanation_medium;

  /// No description provided for @risk_explanation_low.
  ///
  /// In en, this message translates to:
  /// **'Things look steady! Keep tracking so we can catch any changes early.'**
  String get risk_explanation_low;

  /// No description provided for @insight_explanation_insulin.
  ///
  /// In en, this message translates to:
  /// **'Your body might be finding it hard to process sugar smoothly, which can cause energy dips and mood shifts during the day. This is really common and can be managed with small lifestyle tweaks.'**
  String get insight_explanation_insulin;

  /// No description provided for @insight_explanation_androgenic.
  ///
  /// In en, this message translates to:
  /// **'Your symptoms suggest slightly elevated androgen levels, which can show up as skin or hair changes. This is one of the most common PCOS patterns and responds well to gentle care.'**
  String get insight_explanation_androgenic;

  /// No description provided for @insight_explanation_adrenal.
  ///
  /// In en, this message translates to:
  /// **'Your pattern points to stress-related hormonal shifts. The good news? This type responds really well to relaxation, good sleep, and stress management.'**
  String get insight_explanation_adrenal;

  /// No description provided for @insight_explanation_general.
  ///
  /// In en, this message translates to:
  /// **'Your symptoms show some common PCOS patterns. With consistent tracking and the right guidance, these are very manageable.'**
  String get insight_explanation_general;

  /// No description provided for @action_balanced_meals_title.
  ///
  /// In en, this message translates to:
  /// **'Eat balanced, nourishing meals'**
  String get action_balanced_meals_title;

  /// No description provided for @action_balanced_meals_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Think protein, fibre, and healthy fats with every meal.'**
  String get action_balanced_meals_subtitle;

  /// No description provided for @action_light_movement_title.
  ///
  /// In en, this message translates to:
  /// **'Move a little every day'**
  String get action_light_movement_title;

  /// No description provided for @action_light_movement_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Even a 15-min walk after meals can help with insulin.'**
  String get action_light_movement_subtitle;

  /// No description provided for @action_sleep_title.
  ///
  /// In en, this message translates to:
  /// **'Give your body proper rest'**
  String get action_sleep_title;

  /// No description provided for @action_sleep_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Aim for 7-8 hours — your hormones will thank you.'**
  String get action_sleep_subtitle;

  /// No description provided for @action_skin_care_title.
  ///
  /// In en, this message translates to:
  /// **'Be gentle with your skin'**
  String get action_skin_care_title;

  /// No description provided for @action_skin_care_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Mild cleansers and targeted treatments can help a lot.'**
  String get action_skin_care_subtitle;

  /// No description provided for @action_anti_inflammatory_title.
  ///
  /// In en, this message translates to:
  /// **'Add anti-inflammatory foods'**
  String get action_anti_inflammatory_title;

  /// No description provided for @action_anti_inflammatory_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Turmeric, omega-3s, and leafy greens are your friends.'**
  String get action_anti_inflammatory_subtitle;

  /// No description provided for @action_consult_title.
  ///
  /// In en, this message translates to:
  /// **'Talk to a specialist'**
  String get action_consult_title;

  /// No description provided for @action_consult_subtitle.
  ///
  /// In en, this message translates to:
  /// **'An endocrinologist can help check your hormone levels.'**
  String get action_consult_subtitle;

  /// No description provided for @action_stress_title.
  ///
  /// In en, this message translates to:
  /// **'Find your calm'**
  String get action_stress_title;

  /// No description provided for @action_stress_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Try yoga, meditation, or just some deep breaths daily.'**
  String get action_stress_subtitle;

  /// No description provided for @action_cortisol_title.
  ///
  /// In en, this message translates to:
  /// **'Balance your cortisol'**
  String get action_cortisol_title;

  /// No description provided for @action_cortisol_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Less caffeine, more restful sleep. Small changes, big impact.'**
  String get action_cortisol_subtitle;

  /// No description provided for @action_adaptogens_title.
  ///
  /// In en, this message translates to:
  /// **'Try natural adaptogens'**
  String get action_adaptogens_title;

  /// No description provided for @action_adaptogens_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Ashwagandha and tulsi can help your body handle stress.'**
  String get action_adaptogens_subtitle;

  /// No description provided for @wellness_tip_intro.
  ///
  /// In en, this message translates to:
  /// **'Start your morning with warm herbal tea'**
  String get wellness_tip_intro;

  /// No description provided for @wellness_tip_body.
  ///
  /// In en, this message translates to:
  /// **'— it can ease bloating and help your tummy feel calmer.'**
  String get wellness_tip_body;

  /// No description provided for @ask_ovya_anything.
  ///
  /// In en, this message translates to:
  /// **'Ask Ovya anything'**
  String get ask_ovya_anything;

  /// No description provided for @report_generated_success.
  ///
  /// In en, this message translates to:
  /// **'Your report is ready!'**
  String get report_generated_success;

  /// No description provided for @q_irregular_cycle.
  ///
  /// In en, this message translates to:
  /// **'Do you have irregular cycles?'**
  String get q_irregular_cycle;

  /// No description provided for @q_hair_growth.
  ///
  /// In en, this message translates to:
  /// **'Do you have excess body or facial hair?'**
  String get q_hair_growth;

  /// No description provided for @q_family_history.
  ///
  /// In en, this message translates to:
  /// **'Do you have a family history of PCOS?'**
  String get q_family_history;

  /// No description provided for @q_weight_gain.
  ///
  /// In en, this message translates to:
  /// **'Have you experienced unexplained weight gain?'**
  String get q_weight_gain;

  /// No description provided for @q_acne.
  ///
  /// In en, this message translates to:
  /// **'Do you struggle with severe acne?'**
  String get q_acne;

  /// No description provided for @q_skin_darkening.
  ///
  /// In en, this message translates to:
  /// **'Do you have darkening of skin (e.g., around neck)?'**
  String get q_skin_darkening;

  /// No description provided for @q_hair_thinning.
  ///
  /// In en, this message translates to:
  /// **'Are you experiencing hair thinning?'**
  String get q_hair_thinning;

  /// No description provided for @q_fatigue.
  ///
  /// In en, this message translates to:
  /// **'Do you often feel unusually fatigued?'**
  String get q_fatigue;

  /// No description provided for @q_sleep_problems.
  ///
  /// In en, this message translates to:
  /// **'Do you have trouble sleeping?'**
  String get q_sleep_problems;

  /// No description provided for @q_bloating.
  ///
  /// In en, this message translates to:
  /// **'Do you frequently experience bloating?'**
  String get q_bloating;

  /// No description provided for @q_mood_issues.
  ///
  /// In en, this message translates to:
  /// **'Do you experience frequent mood swings?'**
  String get q_mood_issues;

  /// No description provided for @q_over_18.
  ///
  /// In en, this message translates to:
  /// **'Are you over 18 years old?'**
  String get q_over_18;

  /// No description provided for @q_difficulty_conceiving.
  ///
  /// In en, this message translates to:
  /// **'Are you having difficulty conceiving?'**
  String get q_difficulty_conceiving;

  /// No description provided for @trackCycle.
  ///
  /// In en, this message translates to:
  /// **'Track Cycle'**
  String get trackCycle;

  /// No description provided for @logPeriodDates.
  ///
  /// In en, this message translates to:
  /// **'Log your period dates'**
  String get logPeriodDates;

  /// No description provided for @auth_welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Ovya'**
  String get auth_welcome_title;

  /// No description provided for @auth_welcome_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your companion for understanding and managing your health'**
  String get auth_welcome_subtitle;

  /// No description provided for @auth_login_signup_btn.
  ///
  /// In en, this message translates to:
  /// **'Log In / Sign Up'**
  String get auth_login_signup_btn;

  /// No description provided for @auth_guest_btn.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get auth_guest_btn;

  /// No description provided for @auth_private_secure.
  ///
  /// In en, this message translates to:
  /// **'YOUR DATA STAYS PRIVATE AND SECURE'**
  String get auth_private_secure;

  /// No description provided for @auth_gently_guided.
  ///
  /// In en, this message translates to:
  /// **'Your health, gently guided'**
  String get auth_gently_guided;

  /// No description provided for @auth_email_hint.
  ///
  /// In en, this message translates to:
  /// **'you@example.com'**
  String get auth_email_hint;

  /// No description provided for @auth_password_hint.
  ///
  /// In en, this message translates to:
  /// **'........'**
  String get auth_password_hint;

  /// No description provided for @auth_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get auth_forgot_password;

  /// No description provided for @auth_or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get auth_or;

  /// No description provided for @auth_continue_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get auth_continue_google;

  /// No description provided for @auth_dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get auth_dont_have_account;

  /// No description provided for @auth_full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get auth_full_name;

  /// No description provided for @auth_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Jane Doe'**
  String get auth_name_hint;

  /// No description provided for @auth_email_address.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get auth_email_address;

  /// No description provided for @auth_already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get auth_already_have_account;

  /// No description provided for @welcome_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Ovya'**
  String get welcome_title;

  /// No description provided for @welcome_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s understand your health better'**
  String get welcome_subtitle;

  /// No description provided for @welcome_desc.
  ///
  /// In en, this message translates to:
  /// **'Answer a few simple questions to get personalized insights'**
  String get welcome_desc;

  /// No description provided for @welcome_name_hint.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get welcome_name_hint;

  /// No description provided for @welcome_name_label.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get welcome_name_label;

  /// No description provided for @welcome_start_btn.
  ///
  /// In en, this message translates to:
  /// **'Start Assessment'**
  String get welcome_start_btn;

  /// No description provided for @assessment_title.
  ///
  /// In en, this message translates to:
  /// **'ASSESSMENT'**
  String get assessment_title;

  /// No description provided for @assessment_help_text.
  ///
  /// In en, this message translates to:
  /// **'This helps us personalize your sanctuary space.'**
  String get assessment_help_text;

  /// No description provided for @btn_yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get btn_yes;

  /// No description provided for @btn_no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get btn_no;

  /// No description provided for @btn_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get btn_next;

  /// No description provided for @all_set_title.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set'**
  String get all_set_title;

  /// No description provided for @all_set_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your responses...'**
  String get all_set_subtitle;

  /// No description provided for @all_set_btn.
  ///
  /// In en, this message translates to:
  /// **'View Results'**
  String get all_set_btn;

  /// No description provided for @all_set_footer.
  ///
  /// In en, this message translates to:
  /// **'Your data is safe in your sanctuary.'**
  String get all_set_footer;

  /// No description provided for @question_progress.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String question_progress(String current, String total);

  /// No description provided for @cycle_tracking_title.
  ///
  /// In en, this message translates to:
  /// **'Cycle Tracking'**
  String get cycle_tracking_title;

  /// No description provided for @log_new_cycle.
  ///
  /// In en, this message translates to:
  /// **'Log a New Cycle'**
  String get log_new_cycle;

  /// No description provided for @select_start_date.
  ///
  /// In en, this message translates to:
  /// **'Select start date'**
  String get select_start_date;

  /// No description provided for @save_entry.
  ///
  /// In en, this message translates to:
  /// **'Save Entry'**
  String get save_entry;

  /// No description provided for @recent_cycles.
  ///
  /// In en, this message translates to:
  /// **'Recent Cycles'**
  String get recent_cycles;

  /// No description provided for @no_cycle_entries.
  ///
  /// In en, this message translates to:
  /// **'No cycle entries yet.'**
  String get no_cycle_entries;

  /// No description provided for @period_started.
  ///
  /// In en, this message translates to:
  /// **'Period started'**
  String get period_started;

  /// No description provided for @cycle_date_saved.
  ///
  /// In en, this message translates to:
  /// **'Cycle date saved successfully!'**
  String get cycle_date_saved;
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
