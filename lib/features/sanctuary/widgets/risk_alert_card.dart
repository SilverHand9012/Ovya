import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

class RiskAlertCard extends StatelessWidget {
  final bool isHighRisk;
  const RiskAlertCard({super.key, required this.isHighRisk});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Hero(
      tag: 'risk-card',
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: kAlertCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFFFCDD2), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    l10n.elevated_risk,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: kTextSecondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz, color: kTextSecondary),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                l10n.pcos_detected,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: kAccentDeep,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Based on your recent logs, you may be experiencing a flare-up. Let\'s review your symptoms.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: kTextSecondary,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/results');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                  child: Text(
                    '${l10n.review_assessment} →',
                    style: const TextStyle(
                      fontFamily: 'Baloo 2',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
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
