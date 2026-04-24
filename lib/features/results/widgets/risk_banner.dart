import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

class RiskBanner extends StatelessWidget {
  final int riskLevel; // 0 = low, 1 = moderate, 2 = high

  const RiskBanner({super.key, required this.riskLevel});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final Color bgColor = riskLevel >= 1 ? kAlertCard : kGreenCard;
    final String riskText = riskLevel == 2
        ? l10n.high_risk
        : riskLevel == 1
            ? l10n.moderate_risk
            : l10n.low_risk;
            
    final Color riskTextColor = riskLevel == 2
        ? kHighRisk
        : riskLevel == 1
            ? const Color(0xFFFF9800)
            : const Color(0xFF4CAF50);
            
    final double titleFontSize = riskLevel == 2 ? 38 : 32;

    return Hero(
      tag: 'risk-card',
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: kSyncGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'ANALYSIS COMPLETE', // Would be localized in real app if requested
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: kAccentDeep,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  riskText,
                  key: ValueKey<int>(riskLevel),
                  style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w800,
                    color: riskTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.info_outline, size: 16, color: kAccentDeep),
                    const SizedBox(width: 8),
                    Text(
                      'Insulin Resistant PCOS Indicator',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: kAccentDeep,
                        fontWeight: FontWeight.w600,
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
