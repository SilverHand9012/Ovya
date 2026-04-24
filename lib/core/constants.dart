/// Application-wide constants.
class AppConstants {
  AppConstants._();

  static const String appName = 'Ovya';
  static const String geminiModel = 'gemini-2.5-flash';
  static const Duration syncInterval = Duration(minutes: 15);
  static const int maxQueueRetries = 10;
}
