import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import '../../app/theme.dart';
import '../../shared/widgets/ovya_button.dart';
import 'widgets/mood_selector.dart';
import 'widgets/symptom_chip_grid.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  int? _selectedMood;
  final Set<String> _selectedSymptoms = {};
  final TextEditingController _notesController = TextEditingController();
  bool _isSaving = false;
  bool _isSaved = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _onToggleSymptom(String id) {
    setState(() {
      if (_selectedSymptoms.contains(id)) {
        _selectedSymptoms.remove(id);
      } else {
        _selectedSymptoms.add(id);
      }
    });
  }

  Future<void> _handleSave() async {
    if (_isSaving || _isSaved) return;

    setState(() => _isSaving = true);

    // 1. Simulate saving delay (would write to Isar via SymptomRepository)
    await Future.delayed(const Duration(milliseconds: 800));

    if (mounted) {
      setState(() {
        _isSaving = false;
        _isSaved = true;
      });
    }

    // 2. Final confirmation delay
    await Future.delayed(const Duration(milliseconds: 400));

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Log saved ✓'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dateStr = DateFormat('MMM d').format(DateTime.now());

    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // ── 1. Header (NOT in AppBar — part of scroll body) ────
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerLeft,
                            icon: const Icon(Icons.arrow_back, color: kTextPrimary),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            dateStr,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                              children: [
                                const TextSpan(text: 'Your '),
                                TextSpan(
                                  text: 'body',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: kAccent,
                                    fontFamily: Theme.of(context).textTheme.titleLarge?.fontFamily,
                                  ),
                                ),
                                const TextSpan(text: ' today'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // ── 2. Energy & Mood Selector Card ─────────────────────
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverToBoxAdapter(
                      child: MoodSelector(
                        selectedMood: _selectedMood,
                        onMoodSelected: (index) => setState(() => _selectedMood = index),
                      ),
                    ),
                  ),
                  
                  // ── 3. Symptoms & Sensations Card ──────────────────────
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverToBoxAdapter(
                      child: SymptomChipGrid(
                        selectedSymptoms: _selectedSymptoms,
                        onToggleSymptom: _onToggleSymptom,
                      ),
                    ),
                  ),
                  
                  // ── 4. Journal Notes TextField ─────────────────────────
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.journal_notes,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                TextField(
                                  controller: _notesController,
                                  minLines: 4,
                                  maxLines: 8,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText: l10n.journal_hint,
                                    hintStyle: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: kTextSecondary,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    l10n.take_a_breath,
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
                ],
              ),
            ),
            
            // ── 5. Save Log CTA (fixed bottom, outside scroll) ────────
            Padding(
              padding: const EdgeInsets.all(20),
              child: OvyaButton(
                text: l10n.save_log,
                icon: Icons.save_outlined,
                onPressed: _handleSave,
                isLoading: _isSaving,
                isComplete: _isSaved,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
