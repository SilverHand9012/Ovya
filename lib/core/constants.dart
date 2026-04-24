/// Application-wide constants.
class AppConstants {
  AppConstants._();

  static const String appName = 'Ovya';
  static const String geminiModel = 'gemini-1.5-flash';
  static const Duration syncInterval = Duration(minutes: 15);
  static const int maxQueueRetries = 3;

  /// Gemini API key — passed via --dart-define=GEMINI_API_KEY=your_actual_key_here
  /// Leave empty to disable AI insights (offline-only mode).
  static const String geminiApiKey = String.fromEnvironment('GEMINI_API_KEY');
}
