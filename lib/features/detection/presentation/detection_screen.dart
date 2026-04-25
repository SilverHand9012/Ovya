import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../providers/detection_provider.dart';

class _QuestionDef {
  final String key;
  final String Function(AppLocalizations) getLabel;
  const _QuestionDef(this.key, this.getLabel);
}

class DetectionScreen extends ConsumerStatefulWidget {
  const DetectionScreen({super.key});

  @override
  ConsumerState<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends ConsumerState<DetectionScreen> {
  int _currentIndex = 0;
  bool? _isOver18;

  late final List<_QuestionDef> _baseQuestions;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _baseQuestions = [
      _QuestionDef('irregularCycle', (loc) => loc.q_irregular_cycle),
      _QuestionDef('hairGrowth', (loc) => loc.q_hair_growth),
      _QuestionDef('familyHistory', (loc) => loc.q_family_history),
      _QuestionDef('weightGain', (loc) => loc.q_weight_gain),
      _QuestionDef('acne', (loc) => loc.q_acne),
      _QuestionDef('skinDarkening', (loc) => loc.q_skin_darkening),
      _QuestionDef('hairThinning', (loc) => loc.q_hair_thinning),
      _QuestionDef('fatigue', (loc) => loc.q_fatigue),
      _QuestionDef('sleepProblems', (loc) => loc.q_sleep_problems),
      _QuestionDef('bloating', (loc) => loc.q_bloating),
      _QuestionDef('moodIssues', (loc) => loc.q_mood_issues),
    ];
  }

  int get _totalSteps {
    if (_isOver18 == null) return _baseQuestions.length + 1; // base + age check
    if (_isOver18 == true) return _baseQuestions.length + 2; // base + age + conceive
    return _baseQuestions.length + 1; // base + age, ends here
  }

  void _handleAnswer(bool value) async {
    if (_currentIndex < _baseQuestions.length) {
      final key = _baseQuestions[_currentIndex].key;
      ref.read(detectionProvider.notifier).answerQuestion(key, value);
    } else if (_currentIndex == _baseQuestions.length) {
      _isOver18 = value;
    } else {
      ref.read(detectionProvider.notifier).answerQuestion('difficultyConceiving', value);
    }

    // Wait slightly for a smooth UI transition feeling
    await Future.delayed(const Duration(milliseconds: 250));
    if (!mounted) return;

    if (_currentIndex < _totalSteps - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      context.pushReplacement('/detection_result');
    }
  }

  void _handleBack() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        if (_currentIndex == _baseQuestions.length) {
          _isOver18 = null; // Revert age answer if backing into it
        }
      });
    } else {
      if (context.canPop()) {
        context.pop();
      } else {
        context.pushReplacement('/home'); // Fallback
      }
    }
  }

  String _getQuestionText(AppLocalizations loc) {
    if (_currentIndex < _baseQuestions.length) {
      return _baseQuestions[_currentIndex].getLabel(loc);
    } else if (_currentIndex == _baseQuestions.length) {
      return loc.q_over_18;
    } else {
      return loc.q_difficulty_conceiving;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;
    final displayIndex = _currentIndex + 1;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.onSurface),
          onPressed: _handleBack,
        ),
        title: Text(
          "Question $displayIndex of $_totalSteps",
          style: TextStyle(
            color: colors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress indicator
              LinearProgressIndicator(
                value: displayIndex / _totalSteps,
                backgroundColor: colors.primary.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
                borderRadius: BorderRadius.circular(4),
                minHeight: 8,
              ),
              const SizedBox(height: 48),

              // Question text
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _getQuestionText(loc),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                      height: 1.3,
                    ),
                  ),
                ),
              ),

              // Answer Buttons
              Row(
                children: [
                  Expanded(
                    child: _AnswerCard(
                      label: "Yes",
                      icon: Icons.check_circle_outline,
                      onTap: () => _handleAnswer(true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _AnswerCard(
                      label: "No",
                      icon: Icons.cancel_outlined,
                      onTap: () => _handleAnswer(false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _AnswerCard({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colors.outlineVariant,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: colors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: colors.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
