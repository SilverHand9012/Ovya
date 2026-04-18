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

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

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

  /// No description provided for @auth_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get auth_loading;

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
  /// **'Syncing dataâ€¦'**
  String get syncingData;

  /// No description provided for @syncedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Synced successfully'**
  String get syncedSuccessfully;

  /// No description provided for @fetchingInsights.
  ///
  /// In en, this message translates to:
  /// **'Fetching new insightsâ€¦'**
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

  /// No description provided for @rec_track_regularly.
  ///
  /// In en, this message translates to:
  /// **'Continue tracking your symptoms regularly for early detection.'**
  String get rec_track_regularly;

  /// No description provided for @rec_balanced_diet.
  ///
  /// In en, this message translates to:
  /// **'Maintain a balanced diet and consistent exercise routine.'**
  String get rec_balanced_diet;

  /// No description provided for @rec_schedule_checkup.
  ///
  /// In en, this message translates to:
  /// **'Consider scheduling a check-up with your healthcare provider.'**
  String get rec_schedule_checkup;

  /// No description provided for @rec_monitor_cycle.
  ///
  /// In en, this message translates to:
  /// **'Monitor your menstrual cycle closely and note any irregularities.'**
  String get rec_monitor_cycle;

  /// No description provided for @rec_stress_management.
  ///
  /// In en, this message translates to:
  /// **'Incorporate stress-management techniques like yoga or meditation.'**
  String get rec_stress_management;

  /// No description provided for @rec_consult_gynecologist.
  ///
  /// In en, this message translates to:
  /// **'Please consult a gynecologist or endocrinologist as soon as possible.'**
  String get rec_consult_gynecologist;

  /// No description provided for @rec_request_bloodwork.
  ///
  /// In en, this message translates to:
  /// **'Request blood work including hormone panel and insulin levels.'**
  String get rec_request_bloodwork;

  /// No description provided for @rec_symptom_diary.
  ///
  /// In en, this message translates to:
  /// **'Keep a detailed symptom diary to share with your doctor.'**
  String get rec_symptom_diary;

  /// No description provided for @q_irregular_cycle.
  ///
  /// In en, this message translates to:
  /// **'Do you have irregular or missed periods?'**
  String get q_irregular_cycle;

  /// No description provided for @q_hair_growth.
  ///
  /// In en, this message translates to:
  /// **'Have you noticed unusual hair growth on your face or body?'**
  String get q_hair_growth;

  /// No description provided for @q_family_history.
  ///
  /// In en, this message translates to:
  /// **'Do you have a family member with PCOS?'**
  String get q_family_history;

  /// No description provided for @q_weight_gain.
  ///
  /// In en, this message translates to:
  /// **'Have you experienced unexplained weight gain?'**
  String get q_weight_gain;

  /// No description provided for @q_acne.
  ///
  /// In en, this message translates to:
  /// **'Do you have persistent acne?'**
  String get q_acne;

  /// No description provided for @q_skin_darkening.
  ///
  /// In en, this message translates to:
  /// **'Have you noticed dark patches on your skin?'**
  String get q_skin_darkening;

  /// No description provided for @q_hair_thinning.
  ///
  /// In en, this message translates to:
  /// **'Are you experiencing hair thinning or loss?'**
  String get q_hair_thinning;

  /// No description provided for @q_fatigue.
  ///
  /// In en, this message translates to:
  /// **'Do you often feel fatigued or low on energy?'**
  String get q_fatigue;

  /// No description provided for @q_sleep_problems.
  ///
  /// In en, this message translates to:
  /// **'Do you have difficulty sleeping?'**
  String get q_sleep_problems;

  /// No description provided for @q_bloating.
  ///
  /// In en, this message translates to:
  /// **'Do you experience bloating regularly?'**
  String get q_bloating;

  /// No description provided for @q_mood_issues.
  ///
  /// In en, this message translates to:
  /// **'Do you experience frequent mood swings?'**
  String get q_mood_issues;

  /// No description provided for @q_difficulty_conceiving.
  ///
  /// In en, this message translates to:
  /// **'Are you having difficulty conceiving?'**
  String get q_difficulty_conceiving;

  /// No description provided for @q_age_verification.
  ///
  /// In en, this message translates to:
  /// **'Are you 18 years or older?'**
  String get q_age_verification;

  /// No description provided for @btn_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get btn_yes;

  /// No description provided for @btn_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get btn_no;

  /// No description provided for @progress_indicator.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String progress_indicator(int current, int total);

  /// No description provided for @pcos_type_hint.
  ///
  /// In en, this message translates to:
  /// **'Your symptoms suggest {type} PCOS'**
  String pcos_type_hint(String type);

  /// No description provided for @pcos_type_insulin_desc.
  ///
  /// In en, this message translates to:
  /// **'This typically means your body has trouble using insulin effectively, leading to weight gain and irregular cycles.'**
  String get pcos_type_insulin_desc;

  /// No description provided for @pcos_type_androgenic_desc.
  ///
  /// In en, this message translates to:
  /// **'This often involves higher levels of male hormones (androgens) causing excess hair and acne.'**
  String get pcos_type_androgenic_desc;

  /// No description provided for @pcos_type_adrenal_desc.
  ///
  /// In en, this message translates to:
  /// **'This is often triggered by an abnormal response to stress, primarily driven by adrenal androgens.'**
  String get pcos_type_adrenal_desc;

  /// No description provided for @type_insulin_resistant.
  ///
  /// In en, this message translates to:
  /// **'Insulin-resistant'**
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

  /// No description provided for @btn_save_track.
  ///
  /// In en, this message translates to:
  /// **'Save & Track Symptoms'**
  String get btn_save_track;

  /// No description provided for @btn_generate_report.
  ///
  /// In en, this message translates to:
  /// **'Generate Doctor Report'**
  String get btn_generate_report;

  /// No description provided for @log_date_header.
  ///
  /// In en, this message translates to:
  /// **'Today, {date}'**
  String log_date_header(String date);

  /// No description provided for @log_symptoms_label.
  ///
  /// In en, this message translates to:
  /// **'Select your symptoms today'**
  String get log_symptoms_label;

  /// No description provided for @log_notes_label.
  ///
  /// In en, this message translates to:
  /// **'Any notes for today?'**
  String get log_notes_label;

  /// No description provided for @log_save_button.
  ///
  /// In en, this message translates to:
  /// **'Save Log'**
  String get log_save_button;

  /// No description provided for @log_saved_success.
  ///
  /// In en, this message translates to:
  /// **'Saved ✓'**
  String get log_saved_success;

  /// No description provided for @log_already_logged.
  ///
  /// In en, this message translates to:
  /// **'Already logged today'**
  String get log_already_logged;

  /// No description provided for @report_patient_name.
  ///
  /// In en, this message translates to:
  /// **'Patient Name'**
  String get report_patient_name;

  /// No description provided for @report_preview_title.
  ///
  /// In en, this message translates to:
  /// **'Report Preview'**
  String get report_preview_title;

  /// No description provided for @report_share_btn.
  ///
  /// In en, this message translates to:
  /// **'Share via WhatsApp / Apps'**
  String get report_share_btn;

  /// No description provided for @report_print_btn.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get report_print_btn;

  /// No description provided for @report_offline_note.
  ///
  /// In en, this message translates to:
  /// **'This report is generated securely offline.'**
  String get report_offline_note;

  /// No description provided for @home_hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get home_hello;

  /// No description provided for @home_good_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get home_good_morning;

  /// No description provided for @home_good_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get home_good_afternoon;

  /// No description provided for @home_good_evening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get home_good_evening;

  /// No description provided for @home_time_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get home_time_today;

  /// No description provided for @home_time_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get home_time_yesterday;

  /// No description provided for @home_time_days_ago.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String home_time_days_ago(int days);

  /// No description provided for @home_start_assessment.
  ///
  /// In en, this message translates to:
  /// **'Start Health Assessment'**
  String get home_start_assessment;

  /// No description provided for @home_rerun_assessment.
  ///
  /// In en, this message translates to:
  /// **'Re-run Assessment'**
  String get home_rerun_assessment;

  /// No description provided for @home_card_log.
  ///
  /// In en, this message translates to:
  /// **'Log Symptoms'**
  String get home_card_log;

  /// No description provided for @home_logged_done.
  ///
  /// In en, this message translates to:
  /// **'Done ✓'**
  String get home_logged_done;

  /// No description provided for @home_logged_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get home_logged_today;

  /// No description provided for @home_card_report.
  ///
  /// In en, this message translates to:
  /// **'Get Report'**
  String get home_card_report;

  /// No description provided for @home_card_report_sub.
  ///
  /// In en, this message translates to:
  /// **'Share with doctor'**
  String get home_card_report_sub;

  /// No description provided for @home_card_ai.
  ///
  /// In en, this message translates to:
  /// **'Ask Ovya'**
  String get home_card_ai;

  /// No description provided for @home_card_ai_ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get home_card_ai_ready;

  /// No description provided for @home_card_ai_offline.
  ///
  /// In en, this message translates to:
  /// **'Online only'**
  String get home_card_ai_offline;

  /// No description provided for @home_err_offline.
  ///
  /// In en, this message translates to:
  /// **'This feature requires an active internet connection.'**
  String get home_err_offline;

  /// No description provided for @home_card_history.
  ///
  /// In en, this message translates to:
  /// **'My History'**
  String get home_card_history;

  /// No description provided for @home_card_history_sub.
  ///
  /// In en, this message translates to:
  /// **'View past logs'**
  String get home_card_history_sub;

  /// No description provided for @home_empty_risk_title.
  ///
  /// In en, this message translates to:
  /// **'Your PCOS risk assessment will appear here'**
  String get home_empty_risk_title;

  /// No description provided for @home_empty_risk_sub.
  ///
  /// In en, this message translates to:
  /// **'Takes only 2 minutes'**
  String get home_empty_risk_sub;

  /// No description provided for @home_pcos_risk.
  ///
  /// In en, this message translates to:
  /// **'PCOS Risk: {level}'**
  String home_pcos_risk(String level);

  /// No description provided for @home_type_hint.
  ///
  /// In en, this message translates to:
  /// **'{hint} type'**
  String home_type_hint(String hint);

  /// No description provided for @home_last_assessed.
  ///
  /// In en, this message translates to:
  /// **'Last assessed: {time}'**
  String home_last_assessed(String time);

  /// No description provided for @chat_title.
  ///
  /// In en, this message translates to:
  /// **'Ask Ovya'**
  String get chat_title;

  /// No description provided for @chat_context_card.
  ///
  /// In en, this message translates to:
  /// **'Based on your {level} risk assessment...'**
  String chat_context_card(String level);

  /// No description provided for @chat_offline_banner.
  ///
  /// In en, this message translates to:
  /// **'Showing cached response — connect for live guidance'**
  String get chat_offline_banner;

  /// No description provided for @chat_disclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is AI guidance, not medical advice'**
  String get chat_disclaimer;

  /// No description provided for @chat_suggested_title.
  ///
  /// In en, this message translates to:
  /// **'Suggested Questions'**
  String get chat_suggested_title;

  /// No description provided for @chat_suggestion_1.
  ///
  /// In en, this message translates to:
  /// **'What foods should I avoid with PCOS?'**
  String get chat_suggestion_1;

  /// No description provided for @chat_suggestion_2.
  ///
  /// In en, this message translates to:
  /// **'How does stress affect PCOS?'**
  String get chat_suggestion_2;

  /// No description provided for @chat_suggestion_3.
  ///
  /// In en, this message translates to:
  /// **'What should I ask my doctor?'**
  String get chat_suggestion_3;

  /// No description provided for @chat_offline_tooltip.
  ///
  /// In en, this message translates to:
  /// **'Connect to internet to ask Ovya'**
  String get chat_offline_tooltip;

  /// No description provided for @chat_input_hint.
  ///
  /// In en, this message translates to:
  /// **'Ask about your PCOS...'**
  String get chat_input_hint;

  /// No description provided for @pdfTitle.
  ///
  /// In en, this message translates to:
  /// **'Ovya — PCOS Health Report'**
  String get pdfTitle;

  /// No description provided for @pdfDateGenerated.
  ///
  /// In en, this message translates to:
  /// **'Date Generated: {date}'**
  String pdfDateGenerated(String date);

  /// No description provided for @pdfDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This report is for informational purposes only. Please consult a qualified healthcare provider.'**
  String get pdfDisclaimer;

  /// No description provided for @pdfGeneratedBy.
  ///
  /// In en, this message translates to:
  /// **'Generated by Ovya — Women\'s Health Companion'**
  String get pdfGeneratedBy;

  /// No description provided for @patientDetails.
  ///
  /// In en, this message translates to:
  /// **'Patient Details'**
  String get patientDetails;

  /// No description provided for @patientNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name: {name}'**
  String patientNameLabel(String name);

  /// No description provided for @reportDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Report Date: {date}'**
  String reportDateLabel(String date);

  /// No description provided for @riskAssessment.
  ///
  /// In en, this message translates to:
  /// **'Risk Assessment'**
  String get riskAssessment;

  /// No description provided for @riskLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Risk Level:'**
  String get riskLevelLabel;

  /// No description provided for @scoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Score:'**
  String get scoreLabel;

  /// No description provided for @pcosTypeHintLabel.
  ///
  /// In en, this message translates to:
  /// **'PCOS Type Hint:'**
  String get pcosTypeHintLabel;

  /// No description provided for @explanationLabel.
  ///
  /// In en, this message translates to:
  /// **'Explanation:'**
  String get explanationLabel;

  /// No description provided for @symptomsLast30Days.
  ///
  /// In en, this message translates to:
  /// **'Symptoms Reported (Last 30 Days)'**
  String get symptomsLast30Days;

  /// No description provided for @noSymptoms30Days.
  ///
  /// In en, this message translates to:
  /// **'No symptoms logged in the last 30 days.'**
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
  /// **'Mood/Notes'**
  String get tableHeaderMood;

  /// No description provided for @tableNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get tableNone;

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
