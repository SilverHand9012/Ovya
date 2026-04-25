import 'package:flutter/material.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

class RiskBanner extends StatelessWidget {
  final int riskLevel; // 0 = low, 1 = moderate, 2 = high

  const RiskBanner({super.key, required this.riskLevel});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Fallbacks for the design
    final Color bgColor = const Color(0xFFFDE6EA); // Light pink
    final Color pillColor = const Color(0xFF4A152B); // Dark red/purple
    final Color hintPillColor = const Color(0xFFFCB4C4); // Pinkish
    
    final String riskText = riskLevel == 2
        ? l10n.high_risk
        : riskLevel == 1
            ? l10n.moderate_risk
            : l10n.low_risk;
            
    // Based on mockup, we show "Hormonal imbalance detected" and explanation
    final String headline = l10n.hormonal_imbalance_detected;
    final String explanation = riskLevel == 2 
        ? l10n.risk_explanation_high
        : riskLevel == 1
            ? l10n.risk_explanation_medium
            : l10n.risk_explanation_low;

    return Hero(
      tag: 'risk-card',
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                // Decorative Drop Background
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Opacity(
                    opacity: 0.15,
                    child: Image.asset(
                      'assets/images/illustrations/drop.png', // Assuming this exists or similar
                      width: 120,
                      height: 120,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.water_drop,
                        size: 120,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Risk Pill
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: pillColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          riskText.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Headline
                      Text(
                        headline,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF4A152B),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Explanation
                      Text(
                        explanation,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF4A152B).withValues(alpha: 0.8),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Indicator Pill
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: hintPillColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.info, size: 14, color: Color(0xFF4A152B)),
                            const SizedBox(width: 8),
                            Text(
                              l10n.insulin_resistant_pcos_indicator,
                              style: const TextStyle(
                                color: Color(0xFF4A152B),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
