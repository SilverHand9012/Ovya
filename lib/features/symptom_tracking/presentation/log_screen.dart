import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/symptom_entity.dart';
import '../providers/symptom_notifier.dart';

class LogScreen extends ConsumerStatefulWidget {
  const LogScreen({super.key});

  @override
  ConsumerState<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends ConsumerState<LogScreen> {
  int _selectedMood = 3; // 1 to 5, default neutral
  final Set<String> _selectedSymptoms = {};
  final TextEditingController _notesController = TextEditingController();

  final List<String> _emojis = ['😔', '😐', '🙂', '😊', '😄'];

  // All 12 symptoms
  final List<String> _symptomKeys = [
    'irregularCycle', 'hairGrowth', 'hairThinning', 'weightGain',
    'acne', 'skinDarkening', 'fatigue', 'moodIssues', 
    'sleepProblems', 'bloating', 'familyHistory', 'difficultyConceiving'
  ];

  String _getSymptomLabel(String key, AppLocalizations loc) {
    switch (key) {
      case 'irregularCycle': return loc.q_irregular_cycle.replaceAll('Do you have ', '').replaceAll('?', ''); // Simplified
      case 'hairGrowth': return 'Excess hair growth';
      case 'hairThinning': return 'Hair thinning';
      case 'weightGain': return 'Weight gain';
      case 'acne': return 'Acne';
      case 'skinDarkening': return 'Skin darkening';
      case 'fatigue': return 'Fatigue';
      case 'moodIssues': return 'Mood swings';
      case 'sleepProblems': return 'Sleep problems';
      case 'bloating': return 'Bloating';
      case 'familyHistory': return 'Family history';
      case 'difficultyConceiving': return 'Difficulty conceiving';
      default: return key;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  bool _isAlreadyLoggedToday() {
    final state = ref.watch(symptomNotifierProvider);
    if (state.symptoms.isEmpty) return false;
    
    // Sort logic usually puts latest first
    final latest = state.symptoms.first;
    final now = DateTime.now();
    return latest.timestamp.year == now.year &&
           latest.timestamp.month == now.month &&
           latest.timestamp.day == now.day;
  }

  Future<void> _handleSave() async {
    final state = ref.read(symptomNotifierProvider);
    if (state.isLoading) return;

    final loc = AppLocalizations.of(context)!;

    // Mood mapping: if mood is very low (1 or 2), we can optionally flag moodIssues if not natively selected, 
    // but the prompt says they select it independently. We'll append mood to notes to preserve the integer.
    String finalNotes = _notesController.text.trim();
    finalNotes = 'Mood Level: $_selectedMood/5${finalNotes.isNotEmpty ? '\n\n$finalNotes' : ''}';

    final entity = SymptomEntity(
      id: DateTime.now().toIso8601String(),
      timestamp: DateTime.now(),
      irregularCycle: _selectedSymptoms.contains('irregularCycle'),
      hairGrowth: _selectedSymptoms.contains('hairGrowth'),
      hairThinning: _selectedSymptoms.contains('hairThinning'),
      weightGain: _selectedSymptoms.contains('weightGain'),
      acne: _selectedSymptoms.contains('acne'),
      skinDarkening: _selectedSymptoms.contains('skinDarkening'),
      fatigue: _selectedSymptoms.contains('fatigue'),
      moodIssues: _selectedSymptoms.contains('moodIssues'),
      sleepProblems: _selectedSymptoms.contains('sleepProblems'),
      bloating: _selectedSymptoms.contains('bloating'),
      familyHistory: _selectedSymptoms.contains('familyHistory'),
      difficultyConceiving: _selectedSymptoms.contains('difficultyConceiving'),
      notes: finalNotes,
    );

    // This calls save locally, enqueues to firestore, and computes risk offline
    await ref.read(symptomNotifierProvider.notifier).addSymptom(entity);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loc.log_saved_success),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      if (context.canPop()) {
        context.pop();
      } else {
        context.go('/home'); // Ensure we leave the screen
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;
    final state = ref.watch(symptomNotifierProvider);

    final now = DateTime.now();
    final dateString = DateFormat('MMMM d').format(now);
    final headerDate = loc.log_date_header(dateString);

    final alreadyLogged = _isAlreadyLoggedToday();

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: Text(loc.logSymptoms, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: colors.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (alreadyLogged) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: colors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          loc.log_already_logged,
                          style: TextStyle(
                            color: colors.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Header
              Text(
                headerDate,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colors.primary,
                ),
              ),
              const SizedBox(height: 32),

              // Mood Section
              Text(
                loc.howAreYouFeeling,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  final moodValue = index + 1;
                  final isSelected = _selectedMood == moodValue;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMood = moodValue;
                      });
                    },
                    child: AnimatedScale(
                      scale: isSelected ? 1.5 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutBack,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? colors.primary.withOpacity(0.2) : Colors.transparent,
                        ),
                        child: Text(
                          _emojis[index],
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 40),

              // Symptoms Section
              Text(
                loc.log_symptoms_label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 12,
                children: _symptomKeys.map((key) {
                  final isSelected = _selectedSymptoms.contains(key);
                  return FilterChip(
                    label: Text(_getSymptomLabel(key, loc)),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedSymptoms.add(key);
                        } else {
                          _selectedSymptoms.remove(key);
                        }
                      });
                    },
                    selectedColor: colors.primary.withOpacity(0.2),
                    checkmarkColor: colors.primary,
                    labelStyle: TextStyle(
                      color: isSelected ? colors.primary : colors.onSurface,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    backgroundColor: colors.surfaceContainerHighest.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? colors.primary : Colors.transparent,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),

              // Notes Section
              Text(
                loc.log_notes_label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _notesController,
                maxLength: 300,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: loc.notesHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  filled: true,
                  fillColor: colors.surfaceContainerHighest.withOpacity(0.3),
                ),
              ),
              const SizedBox(height: 32),

              // Save Button
              ElevatedButton(
                onPressed: state.isLoading ? null : _handleSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: state.isLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: colors.onPrimary,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        loc.log_save_button,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              if (FirebaseAuth.instance.currentUser == null) ...[
                const SizedBox(height: 12),
                Text(
                  "Your data will sync once you sign in",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: colors.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
