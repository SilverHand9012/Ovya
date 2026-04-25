import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../../app/theme.dart';
import '../../symptom_tracking/providers/symptom_notifier.dart';
import '../providers/chat_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen>
    with SingleTickerProviderStateMixin {
  final _inputController = TextEditingController();
  final _scrollController = ScrollController();
  late AnimationController _heroController;
  late Animation<double> _heroFade;
  late Animation<Offset> _heroSlide;

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _heroFade = CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeIn,
    );
    _heroSlide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeOutCubic,
    ));

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) _heroController.forward();
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    _heroController.dispose();
    super.dispose();
  }

  void _submitQuestion(String question) {
    if (question.trim().isEmpty) return;

    _inputController.clear();
    FocusScope.of(context).unfocus();

    final riskContext = ref.read(symptomNotifierProvider).riskResult;
    final langCode = Localizations.localeOf(context).languageCode;

    ref.read(chatProvider.notifier).askQuestion(
          question.trim(),
          riskContext,
          langCode,
        );

    // Scroll to bottom after a frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final chatState = ref.watch(chatProvider);

    return Scaffold(
      backgroundColor: kBackground,
      // ── AppBar ───────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
        title: Text(
          loc.chat_ask_ovya_title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: kTextPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: kAccent,
              child: const Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ── Scrollable content ──────────────────────────────
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                children: [
                  // ── Hero Card ─────────────────────────────────
                  FadeTransition(
                    opacity: _heroFade,
                    child: SlideTransition(
                      position: _heroSlide,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.6),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Positioned(
                                left: -10,
                                bottom: -10,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: kPurpleCard.withValues(alpha: 0.4),
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/illustrations/face1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 64),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      loc.chat_personal_guide,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: kAccent,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.8,
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      loc.chat_wellness_sanctuary,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            height: 1.2,
                                          ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      loc.chat_wellness_subtitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: kTextSecondary,
                                            height: 1.4,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ── Chat messages ─────────────────────────────
                  // Ovya greeting
                  _OvyaBubble(
                    text: loc.chat_greeting,
                  ),
                  const SizedBox(height: 12),

                  // Show conversation history
                  if (chatState.lastQuestion != null &&
                      chatState.lastResponse != null) ...[
                    _UserBubble(text: chatState.lastQuestion!),
                    const SizedBox(height: 12),
                    _OvyaBubble(text: chatState.lastResponse!),
                    const SizedBox(height: 12),
                  ],

                  // Loading indicator
                  if (chatState.isLoading)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, top: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.auto_awesome,
                                size: 14, color: kAccent),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: kAccent,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              loc.chat_thinking,
                              style: TextStyle(
                                fontSize: 13,
                                color: kTextSecondary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  const SizedBox(height: 16),

                  // ── Suggestion chips ──────────────────────────
                  SizedBox(
                    height: 38,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _SuggestionChip(
                          label: loc.chat_chip_sleep,
                          onTap: () {
                            _inputController.text =
                                loc.chat_suggest_sleep;
                          },
                        ),
                        const SizedBox(width: 10),
                        _SuggestionChip(
                          label: loc.chat_chip_stress,
                          onTap: () {
                            _inputController.text =
                                loc.chat_suggest_stress;
                          },
                        ),
                        const SizedBox(width: 10),
                        _SuggestionChip(
                          label: loc.chat_chip_hormonal,
                          onTap: () {
                            _inputController.text =
                                loc.chat_suggest_hormonal;
                          },
                        ),
                        const SizedBox(width: 10),
                        _SuggestionChip(
                          label: loc.chat_chip_diet,
                          onTap: () {
                            _inputController.text =
                                loc.chat_suggest_diet;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            // ── Input bar ───────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              color: kBackground,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.6),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _inputController,
                            enabled: !chatState.isLoading,
                            style: Theme.of(context).textTheme.bodyLarge,
                            decoration: InputDecoration(
                              hintText: loc.chat_input_placeholder,
                              hintStyle: TextStyle(
                                color: kTextSecondary.withValues(alpha: 0.6),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                            ),
                            textInputAction: TextInputAction.send,
                            onSubmitted: (val) {
                              if (!chatState.isOffline &&
                                  !chatState.isLoading) {
                                _submitQuestion(val);
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: GestureDetector(
                            onTap: chatState.isLoading
                                ? null
                                : () => _submitQuestion(_inputController.text),
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: (chatState.isOffline ||
                                        chatState.isLoading)
                                    ? kTextSecondary.withValues(alpha: 0.3)
                                    : kAccent,
                                shape: BoxShape.circle,
                              ),
                              child: chatState.isLoading
                                  ? const Center(
                                      child: SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : const Icon(Icons.arrow_upward,
                                      color: Colors.white, size: 22),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    loc.chat_companion_note,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: kTextSecondary.withValues(alpha: 0.6),
                          letterSpacing: 0.5,
                          fontSize: 10,
                        ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Ovya (bot) chat bubble ──────────────────────────────────────
class _OvyaBubble extends StatelessWidget {
  final String text;
  const _OvyaBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label row
        Row(
          children: [
            Icon(Icons.auto_awesome, size: 14, color: kAccent),
            const SizedBox(width: 6),
            Text(
              AppLocalizations.of(context)?.chat_ovya_label ?? 'OVYA',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: kAccent,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        // Bubble
        Container(
          margin: const EdgeInsets.only(right: 40),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: kPurpleCard.withValues(alpha: 0.35),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: kTextPrimary,
                  height: 1.5,
                ),
          ),
        ),
      ],
    );
  }
}

// ── User chat bubble ────────────────────────────────────────────
class _UserBubble extends StatelessWidget {
  final String text;
  const _UserBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 60),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: kTextPrimary,
                height: 1.5,
              ),
        ),
      ),
    );
  }
}

// ── Suggestion chip ─────────────────────────────────────────────
class _SuggestionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SuggestionChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kAccent.withValues(alpha: 0.3), width: 1),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: kAccent,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
        ),
      ),
    );
  }
}
