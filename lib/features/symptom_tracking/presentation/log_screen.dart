import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/symptom_entity.dart';
import '../providers/symptom_notifier.dart';
import '../../../core/intelligence/detection_engine.dart';
import '../../../shared/utils/recommendation_resolver.dart';
import '../../../shared/widgets/status_banner.dart';

/// Screen for logging PCOS symptoms and viewing risk evaluation.
///
/// Flow:
///   1. User toggles symptom switches.
///   2. Optionally adds notes.
///   3. Taps "Log Symptoms" → data saved locally + detection runs.
///   4. Risk result card appears below the form.
///   5. History list shows past entries.
class LogScreen extends ConsumerStatefulWidget {
  const LogScreen({super.key});

  @override
  ConsumerState<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends ConsumerState<LogScreen> {
  // ── Form state ───────────────────────────────────────────────

  // Original symptoms
  bool _irregularCycle = false;
  bool _acne = false;
  bool _weightGain = false;
  bool _hairGrowth = false;
  bool _moodIssues = false;

  // Extended symptoms
  bool _hairThinning = false;
  bool _skinDarkening = false;
  bool _fatigue = false;
  bool _sleepProblems = false;
  bool _bloating = false;
  bool _familyHistory = false;
  bool _difficultyConceiving = false;

  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load existing logs on first build.
    Future.microtask(() {
      ref.read(symptomNotifierProvider.notifier).loadSymptoms();
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  // ── Submit ───────────────────────────────────────────────────

  void _submit() {
    final symptom = SymptomEntity(
      id: '',
      timestamp: DateTime.now(),
      irregularCycle: _irregularCycle,
      acne: _acne,
      weightGain: _weightGain,
      hairGrowth: _hairGrowth,
      moodIssues: _moodIssues,
      hairThinning: _hairThinning,
      skinDarkening: _skinDarkening,
      fatigue: _fatigue,
      sleepProblems: _sleepProblems,
      bloating: _bloating,
      familyHistory: _familyHistory,
      difficultyConceiving: _difficultyConceiving,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );

    ref.read(symptomNotifierProvider.notifier).addSymptom(symptom);

    // Reset form.
    setState(() {
      _irregularCycle = false;
      _acne = false;
      _weightGain = false;
      _hairGrowth = false;
      _moodIssues = false;
      _hairThinning = false;
      _skinDarkening = false;
      _fatigue = false;
      _sleepProblems = false;
      _bloating = false;
      _familyHistory = false;
      _difficultyConceiving = false;
    });
    _notesController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Symptoms logged successfully!')),
    );
  }

  // ── Build ────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(symptomNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Symptoms'),
        actions: [
          IconButton(
            icon: const Icon(Icons.insights),
            tooltip: 'View Insights',
            onPressed: () =>
                Navigator.of(context).pushNamed('/insights'),
          ),
        ],
      ),
      body: Column(
        children: [
          const SyncStatusBanner(),
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // ── Symptom toggles ────────────────────────────
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            'How are you feeling today?',
                            style: theme.textTheme.titleMedium,
                          ),
                        ),

                        // ── Core symptoms ──────────────────────
                        _buildSwitch(
                          'Irregular Cycle',
                          Icons.loop,
                          _irregularCycle,
                          (v) => setState(() => _irregularCycle = v),
                        ),
                        _buildSwitch(
                          'Acne',
                          Icons.face,
                          _acne,
                          (v) => setState(() => _acne = v),
                        ),
                        _buildSwitch(
                          'Weight Gain',
                          Icons.monitor_weight,
                          _weightGain,
                          (v) => setState(() => _weightGain = v),
                        ),
                        _buildSwitch(
                          'Excess Hair Growth',
                          Icons.content_cut,
                          _hairGrowth,
                          (v) => setState(() => _hairGrowth = v),
                        ),
                        _buildSwitch(
                          'Mood Issues',
                          Icons.mood_bad,
                          _moodIssues,
                          (v) => setState(() => _moodIssues = v),
                        ),

                        const Divider(height: 1),

                        // ── Extended symptoms ──────────────────
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            'Additional indicators',
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                        _buildSwitch(
                          'Hair Thinning / Loss',
                          Icons.healing,
                          _hairThinning,
                          (v) => setState(() => _hairThinning = v),
                        ),
                        _buildSwitch(
                          'Skin Darkening',
                          Icons.contrast,
                          _skinDarkening,
                          (v) => setState(() => _skinDarkening = v),
                        ),
                        _buildSwitch(
                          'Fatigue',
                          Icons.battery_alert,
                          _fatigue,
                          (v) => setState(() => _fatigue = v),
                        ),
                        _buildSwitch(
                          'Sleep Problems',
                          Icons.bedtime,
                          _sleepProblems,
                          (v) => setState(() => _sleepProblems = v),
                        ),
                        _buildSwitch(
                          'Bloating',
                          Icons.water_drop,
                          _bloating,
                          (v) => setState(() => _bloating = v),
                        ),
                        _buildSwitch(
                          'Family History of PCOS',
                          Icons.family_restroom,
                          _familyHistory,
                          (v) => setState(() => _familyHistory = v),
                        ),
                        _buildSwitch(
                          'Difficulty Conceiving',
                          Icons.favorite_border,
                          _difficultyConceiving,
                          (v) => setState(() => _difficultyConceiving = v),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // ── Notes ──────────────────────────────────────
                TextField(
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Notes (optional)',
                    border: OutlineInputBorder(),
                    hintText: 'Any additional details...',
                  ),
                  maxLines: 3,
                ),

                const SizedBox(height: 16),

                // ── Submit button ──────────────────────────────
                FilledButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text('Log Symptoms'),
                ),

                // ── Risk result card ───────────────────────────
                if (state.riskResult != null) ...[
                  const SizedBox(height: 24),
                  _RiskResultCard(result: state.riskResult!),
                ],

                // ── Error message ──────────────────────────────
                if (state.errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    state.errorMessage!,
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ],

                // ── History ────────────────────────────────────
                if (state.symptoms.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text(
                    'History',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  ...state.symptoms.map(
                    (s) => _SymptomHistoryTile(
                      symptom: s,
                      onDelete: () => ref
                          .read(symptomNotifierProvider.notifier)
                          .deleteSymptom(s.id),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────

  Widget _buildSwitch(
    String label,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      title: Text(label),
      secondary: Icon(icon),
      value: value,
      onChanged: onChanged,
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  Risk result card
// ──────────────────────────────────────────────────────────────

class _RiskResultCard extends StatelessWidget {
  final RiskResult result;

  const _RiskResultCard({required this.result});

  Color _levelColor(String level) {
    switch (level) {
      case 'High':
        return Colors.red.shade700;
      case 'Medium':
        return Colors.orange.shade700;
      default:
        return Colors.green.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _levelColor(result.level);

    // Resolve l10n recommendation keys → localized strings.
    final resolvedRecs =
        resolveRecommendations(context, result.recommendations);

    return Card(
      color: color.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.assessment, color: color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Risk Level: ${result.level}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Chip(
                  label: Text('Score: ${result.score}'),
                  backgroundColor: color.withValues(alpha: 0.2),
                ),
              ],
            ),

            // ── PCOS type hint ──────────────────────────────────
            if (result.pcosTypeHint != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Possible type: ${result.pcosTypeHint}',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 12),
            Text(
              result.explanation,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              'Recommendations',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            ...resolvedRecs.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• '),
                    Expanded(child: Text(r)),
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

// ──────────────────────────────────────────────────────────────
//  Symptom history tile
// ──────────────────────────────────────────────────────────────

class _SymptomHistoryTile extends StatelessWidget {
  final SymptomEntity symptom;
  final VoidCallback onDelete;

  const _SymptomHistoryTile({
    required this.symptom,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final activeSymptoms = <String>[];
    if (symptom.irregularCycle) activeSymptoms.add('Irregular Cycle');
    if (symptom.acne) activeSymptoms.add('Acne');
    if (symptom.weightGain) activeSymptoms.add('Weight Gain');
    if (symptom.hairGrowth) activeSymptoms.add('Hair Growth');
    if (symptom.moodIssues) activeSymptoms.add('Mood Issues');
    if (symptom.hairThinning) activeSymptoms.add('Hair Thinning');
    if (symptom.skinDarkening) activeSymptoms.add('Skin Darkening');
    if (symptom.fatigue) activeSymptoms.add('Fatigue');
    if (symptom.sleepProblems) activeSymptoms.add('Sleep Problems');
    if (symptom.bloating) activeSymptoms.add('Bloating');
    if (symptom.familyHistory) activeSymptoms.add('Family History');
    if (symptom.difficultyConceiving) activeSymptoms.add('Difficulty Conceiving');

    final date =
        '${symptom.timestamp.day}/${symptom.timestamp.month}/${symptom.timestamp.year}';

    return Dismissible(
      key: ValueKey(symptom.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${activeSymptoms.length}'),
        ),
        title: Text(
          activeSymptoms.isEmpty ? 'No symptoms' : activeSymptoms.join(', '),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(date),
        trailing: symptom.notes != null
            ? const Icon(Icons.note, size: 18)
            : null,
      ),
    );
  }
}
