import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

class SymptomChipGrid extends StatefulWidget {
  final Set<String> selectedSymptoms;
  final Function(String) onToggleSymptom;

  const SymptomChipGrid({
    super.key,
    required this.selectedSymptoms,
    required this.onToggleSymptom,
  });

  @override
  State<SymptomChipGrid> createState() => _SymptomChipGridState();
}

class _SymptomChipGridState extends State<SymptomChipGrid> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final symptoms = [
      {'id': 'headache', 'label': l10n.symptom_headache},
      {'id': 'cramps', 'label': l10n.symptom_cramps},
      {'id': 'fatigue', 'label': l10n.symptom_fatigue},
      {'id': 'bloating', 'label': l10n.symptom_bloating},
      {'id': 'nausea', 'label': l10n.symptom_nausea},
      {'id': 'backache', 'label': l10n.symptom_backache},
      {'id': 'insomnia', 'label': l10n.symptom_insomnia},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kGreenCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.symptoms_sensations,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: symptoms.map((symptom) {
              final isSelected = widget.selectedSymptoms.contains(symptom['id']);
              return FilterChip(
                label: Text(symptom['label']!),
                selected: isSelected,
                onSelected: (_) => widget.onToggleSymptom(symptom['id']!),
                selectedColor: kAccent,
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : kTextPrimary,
                  fontFamily: 'Baloo 2',
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected ? kAccent : kTextSecondary.withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                showCheckmark: true,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
