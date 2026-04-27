import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../providers/detection_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../onboarding/providers/onboarding_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool? _selectedAnswer;

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

  void _handleNext() async {
    if (_selectedAnswer == null) return;

    final value = _selectedAnswer!;

    if (_currentIndex < _baseQuestions.length) {
      final key = _baseQuestions[_currentIndex].key;
      ref.read(detectionProvider.notifier).answerQuestion(key, value);
    } else if (_currentIndex == _baseQuestions.length) {
      _isOver18 = value;
    } else {
      ref.read(detectionProvider.notifier).answerQuestion('difficultyConceiving', value);
    }

    if (!mounted) return;

    if (_currentIndex < _totalSteps - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null; // reset for next question
      });
    } else {
      final uid = FirebaseAuth.instance.currentUser?.uid ?? 'guest';
      await OnboardingController.markAssessmentComplete(uid, ref);
      
      if (!mounted) return;
      context.pushReplacement('/analyzing');
    }
  }

  void _handleBack() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _selectedAnswer = null;
        if (_currentIndex == _baseQuestions.length) {
          _isOver18 = null; // Revert age answer if backing into it
        }
      });
    } else {
      if (mounted) {
        context.go('/welcome');
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
    const darkTextColor = Color(0xFF2C1A2E);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4B32A4)),
          onPressed: _handleBack,
        ),
        title: const Text(
          "Ovya",
          style: TextStyle(
            color: Color(0xFF4B32A4),
            fontWeight: FontWeight.w900,
            fontSize: 24,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    loc.assessment_title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: darkTextColor.withValues(alpha: 0.6),
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    loc.question_progress(displayIndex.toString(), _totalSteps.toString()),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: darkTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: displayIndex / _totalSteps,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6B5B95)),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 32),

              // Question Card
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getQuestionText(loc),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: darkTextColor,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      loc.assessment_help_text,
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: darkTextColor.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 48),

              // Answer Buttons
              Row(
                children: [
                  Expanded(
                    child: _AnswerCard(
                      label: loc.btn_yes,
                      icon: Icons.check,
                      isSelected: _selectedAnswer == true,
                      onTap: () => setState(() => _selectedAnswer = true),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _AnswerCard(
                      label: loc.btn_no,
                      icon: Icons.close,
                      isSelected: _selectedAnswer == false,
                      onTap: () => setState(() => _selectedAnswer = false),
                    ),
                  ),
                ],
              ),
              
              const Spacer(),

              // Next Button
              Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: _selectedAnswer == null ? Colors.grey.shade400 : const Color(0xFF6B5B95),
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: _selectedAnswer == null ? [] : [
                    BoxShadow(
                      color: const Color(0xFF6B5B95).withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _selectedAnswer == null ? null : _handleNext,
                    borderRadius: BorderRadius.circular(32),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            loc.btn_next,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
  final bool isSelected;
  final VoidCallback onTap;

  const _AnswerCard({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEBE6FC) : Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF6B5B95) : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 28,
                color: isSelected ? Colors.white : Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: isSelected ? const Color(0xFF4B32A4) : const Color(0xFF2C1A2E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

