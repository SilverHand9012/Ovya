import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../symptom_tracking/providers/symptom_notifier.dart';
import '../providers/chat_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _submitQuestion(String question) {
    if (question.trim().isEmpty) return;
    
    // Clear input
    _inputController.clear();
    FocusScope.of(context).unfocus();

    final riskContext = ref.read(symptomNotifierProvider).riskResult;
    final langCode = Localizations.localeOf(context).languageCode;
    
    ref.read(chatProvider.notifier).askQuestion(question.trim(), riskContext, langCode);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;
    final chatState = ref.watch(chatProvider);
    final riskContext = ref.watch(symptomNotifierProvider).riskResult;

    final langCode = Localizations.localeOf(context).languageCode.toUpperCase();

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(loc.chat_title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                langCode,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: colors.onPrimaryContainer),
              ),
            ),
          ],
        ),
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Fixed Context Card
            if (riskContext != null)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerHighest.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 20, color: colors.onSurface.withOpacity(0.6)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        loc.chat_context_card(riskContext.level),
                        style: TextStyle(fontSize: 13, color: colors.onSurface.withOpacity(0.8)),
                      ),
                    ),
                  ],
                ),
              ),

            // Scrollable Response Area
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Offline Banner
                  if (chatState.isOffline && chatState.lastResponse != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.cloud_off, size: 20, color: colors.onErrorContainer),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              loc.chat_offline_banner,
                              style: TextStyle(color: colors.onErrorContainer, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // History / Response
                  if (chatState.lastQuestion != null && chatState.lastResponse != null) ...[
                    // User Bubble
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(left: 40, bottom: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: colors.primary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Text(
                          chatState.lastQuestion!,
                          style: TextStyle(color: colors.onPrimary, fontSize: 15),
                        ),
                      ),
                    ),
                    
                    // Bot Bubble
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(right: 40, bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: colors.secondaryContainer.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(4),
                          ),
                          border: Border.all(color: colors.outlineVariant.withOpacity(0.3)),
                        ),
                        child: Text(
                          chatState.lastResponse!,
                          style: TextStyle(color: colors.onSurface, fontSize: 15, height: 1.4),
                        ),
                      ),
                    ),
                    
                    // Disclaimer
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 32),
                      child: Row(
                        children: [
                          Icon(Icons.warning_amber_rounded, size: 14, color: colors.onSurface.withOpacity(0.4)),
                          const SizedBox(width: 6),
                          Text(
                            loc.chat_disclaimer,
                            style: TextStyle(fontSize: 12, color: colors.onSurface.withOpacity(0.4)),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Suggested Chips
                  Text(
                    loc.chat_suggested_title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colors.onSurface),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _SuggestedChip(
                        label: loc.chat_suggestion_1,
                        onTap: () => _inputController.text = loc.chat_suggestion_1,
                        colors: colors,
                      ),
                      _SuggestedChip(
                        label: loc.chat_suggestion_2,
                        onTap: () => _inputController.text = loc.chat_suggestion_2,
                        colors: colors,
                      ),
                      _SuggestedChip(
                        label: loc.chat_suggestion_3,
                        onTap: () => _inputController.text = loc.chat_suggestion_3,
                        colors: colors,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            // Input Row
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surface,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: Tooltip(
                        message: chatState.isOffline ? loc.chat_offline_tooltip : '',
                        child: TextField(
                          controller: _inputController,
                          enabled: !chatState.isOffline && !chatState.isLoading,
                          decoration: InputDecoration(
                            hintText: loc.chat_input_hint,
                            hintStyle: TextStyle(color: colors.onSurface.withOpacity(0.4)),
                            filled: true,
                            fillColor: chatState.isOffline 
                                ? colors.surfaceContainerHighest.withOpacity(0.2)
                                : colors.surfaceContainerHighest.withOpacity(0.4),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          ),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (val) {
                            if (!chatState.isOffline && !chatState.isLoading) {
                              _submitQuestion(val);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: (chatState.isOffline || chatState.isLoading) 
                            ? colors.surfaceContainerHighest 
                            : colors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: chatState.isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: colors.onSurface.withOpacity(0.5)),
                              )
                            : Icon(Icons.send, color: (chatState.isOffline || chatState.isLoading) ? colors.onSurface.withOpacity(0.4) : colors.onPrimary),
                        onPressed: (chatState.isOffline || chatState.isLoading) 
                            ? null 
                            : () => _submitQuestion(_inputController.text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestedChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final ColorScheme colors;

  const _SuggestedChip({
    required this.label,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap,
      label: Text(label, style: const TextStyle(fontSize: 13)),
      backgroundColor: colors.surfaceContainerHighest.withOpacity(0.3),
      side: BorderSide(color: colors.outlineVariant.withOpacity(0.3)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
