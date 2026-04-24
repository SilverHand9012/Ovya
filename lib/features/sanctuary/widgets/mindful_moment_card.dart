import 'package:flutter/material.dart';
import '../../../app/theme.dart';

class MindfulMomentCard extends StatelessWidget {
  final String title;
  final String description;

  const MindfulMomentCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (context) => _MindfulMomentSheet(title: title, description: description),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: kYellowCard,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.local_florist, color: kAccentDeep), // Placeholder for herb icon
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: kTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MindfulMomentSheet extends StatelessWidget {
  final String title;
  final String description;

  const _MindfulMomentSheet({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
