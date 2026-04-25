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
          border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                left: -10,
                bottom: -10,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: kYellowCard.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Opacity(
                      opacity: 0.8,
                      child: Image.asset(
                        'assets/images/illustrations/flower1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64, top: 16, bottom: 16, right: 16),
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
