import 'package:flutter/material.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import '../../../app/theme.dart';

class MoodSelector extends StatefulWidget {
  final int? selectedMood;
  final Function(int) onMoodSelected;

  const MoodSelector({
    super.key,
    this.selectedMood,
    required this.onMoodSelected,
  });

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  final List<String> _moods = ['😔', '😕', '😐', '🙂', '😊'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kPurpleCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.energy_mood,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_moods.length, (index) {
              final isSelected = widget.selectedMood == index;
              return GestureDetector(
                onTap: () => widget.onMoodSelected(index),
                child: AnimatedScale(
                  scale: isSelected ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        _moods[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
