
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants.dart';
import '../../../core/intelligence/detection_engine.dart';
import '../../../shared/providers/connectivity_provider.dart';
import '../../ai_insights/data/insight_cache_service.dart';

class ChatState {
  final String? lastQuestion;
  final String? lastResponse;
  final bool isLoading;
  final bool isOffline;

  const ChatState({
    this.lastQuestion,
    this.lastResponse,
    this.isLoading = false,
    this.isOffline = false,
  });

  ChatState copyWith({
    String? lastQuestion,
    String? lastResponse,
    bool? isLoading,
    bool? isOffline,
    bool clearQuestion = false,
  }) {
    return ChatState(
      lastQuestion: clearQuestion ? null : (lastQuestion ?? this.lastQuestion),
      lastResponse: lastResponse ?? this.lastResponse,
      isLoading: isLoading ?? this.isLoading,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}

class ChatNotifier extends Notifier<ChatState> {
  late final InsightCacheService _cacheService;
  
  @override
  ChatState build() {
    _cacheService = InsightCacheService();
    
    // Listen to connectivity dynamically
    ref.listen(connectivityProvider, (previous, next) {
      final isOnline = next.valueOrNull ?? true;
      if (state.isOffline != !isOnline) {
        state = state.copyWith(isOffline: !isOnline);
      }
    });

    _loadInitialState();
    
    final isOnline = ref.read(connectivityProvider).valueOrNull ?? true;
    return ChatState(isOffline: !isOnline);
  }

  Future<void> _loadInitialState() async {
    state = state.copyWith(isLoading: true);
    try {
      final cached = await _cacheService.getLatestInsight();
      final prefs = await SharedPreferences.getInstance();
      final savedQuestion = prefs.getString('chat_last_question');

      state = state.copyWith(
        lastResponse: cached?.insightText,
        lastQuestion: savedQuestion,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> askQuestion(String question, RiskResult? contextData, String languageCode) async {
    if (question.trim().isEmpty) return;

    state = state.copyWith(
      isLoading: true,
      lastQuestion: question,
    );

    // Save question immediately for persistent reload matching latest response
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('chat_last_question', question);

    if (state.isOffline) {
      // Just fallback to returning existing cached response
      final cached = await _cacheService.getLatestInsight();
      state = state.copyWith(
        isLoading: false,
        lastResponse: cached?.insightText ?? 
            'You are currently offline. Your question has been saved and I\'ll respond when you\'re back online. 💜',
      );
      return;
    }

    try {
      final level = contextData?.level ?? 'Unknown';
      final score = contextData?.score ?? 0;
      final type = contextData?.pcosTypeHint ?? 'Unknown';

      final promptText = '''
You are Ovya, a compassionate women's health assistant specializing in PCOS. 
The user has a $level PCOS risk score of $score/23. Their likely PCOS type is $type.
Answer in $languageCode in simple, non-clinical language. 
Be warm and encouraging. Keep response under 150 words.
Always end with: consult a gynecologist for diagnosis.

User Question: $question
''';

      final modelName = AppConstants.geminiModel;
      debugPrint('[Chat] Sending request to Gemini via Firebase AI (model: $modelName)...');

      // Use Firebase AI with Google AI backend
      // Firebase handles the API key via google-services.json / Firebase config
      final model = FirebaseAI.googleAI(
        auth: FirebaseAuth.instance,
      ).generativeModel(
        model: modelName,
      );

      final response = await model.generateContent([
        Content.text(promptText),
      ]).timeout(const Duration(seconds: 30));
      
      final text = response.text;
      debugPrint('[Chat] Response received: ${text?.substring(0, (text != null && text.length > 50 ? 50 : (text?.length ?? 0)))}...');
      
      if (text != null && text.isNotEmpty) {
        // Cache success
        await _cacheService.saveInsight(text, isFromAi: true);
        state = state.copyWith(isLoading: false, lastResponse: text);
      } else {
        throw Exception("Empty response");
      }
    } catch (e, stackTrace) {
      // Log the actual error for debugging
      debugPrint('[Chat] ERROR: $e');
      debugPrint('[Chat] Stack: $stackTrace');
      
      // Load last cached on failure, or show a friendly fallback
      final cached = await _cacheService.getLatestInsight();
      state = state.copyWith(
        isLoading: false,
        lastResponse: cached?.insightText ?? 
            'I wasn\'t able to process that right now, but I\'m still here for you. 💜 '
            'Try again in a moment, or check your internet connection. '
            'Always consult a gynecologist for medical advice.',
      );
    }
  }
}

final chatProvider = NotifierProvider<ChatNotifier, ChatState>(() {
  return ChatNotifier();
});
