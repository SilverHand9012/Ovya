import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../../core/intelligence/detection_engine.dart';
import '../providers/detection_provider.dart';

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  late final RiskResult _result;
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    // compute once upon initialization
    _result = ref.read(detectionProvider.notifier).computeResult();
    
    // trigger animation shortly after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _showAnimation = true;
          });
        }
      });
    });
  }

  Color _getRiskColor(String level, ColorScheme colors) {
    switch (level.toLowerCase()) {
      case 'low':
        return Colors.green.shade600;
      case 'medium':
        return Colors.amber.shade700;
      case 'high':
        return colors.error;
      default:
        return colors.primary;
    }
  }

  IconData _getRiskIcon(String level) {
    switch (level.toLowerCase()) {
      case 'low':
        return Icons.check_circle_outline;
      case 'medium':
        return Icons.info_outline;
      case 'high':
        return Icons.warning_amber_rounded;
      default:
        return Icons.analytics_outlined;
    }
  }

  String _getRecommendation(AppLocalizations loc, String key) {
    switch (key) {
      case 'rec_track_regularly':
        return loc.rec_track_regularly;
      case 'rec_balanced_diet':
        return loc.rec_balanced_diet;
      case 'rec_schedule_checkup':
        return loc.rec_schedule_checkup;
      case 'rec_monitor_cycle':
        return loc.rec_monitor_cycle;
      case 'rec_stress_management':
        return loc.rec_stress_management;
      case 'rec_consult_gynecologist':
        return loc.rec_consult_gynecologist;
      case 'rec_request_bloodwork':
        return loc.rec_request_bloodwork;
      case 'rec_symptom_diary':
        return loc.rec_symptom_diary;
      default:
        return key;
    }
  }

  String _getPcosTypeName(AppLocalizations loc, String type) {
    switch (type) {
      case 'Insulin-resistant':
        return loc.type_insulin_resistant;
      case 'Androgenic':
        return loc.type_androgenic;
      case 'Adrenal':
        return loc.type_adrenal;
      default:
        return type;
    }
  }

  String _getPcosTypeDesc(AppLocalizations loc, String type) {
    switch (type) {
      case 'Insulin-resistant':
        return loc.insight_explanation_insulin;
      case 'Androgenic':
        return loc.insight_explanation_androgenic;
      case 'Adrenal':
        return loc.insight_explanation_adrenal;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;
    final riskColor = _getRiskColor(_result.level, colors);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        title: Text(
          loc.appTitle,
          style: TextStyle(color: colors.onSurface, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Risk Indicator
              AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutBack,
                transform: Matrix4.translationValues(0, _showAnimation ? 0 : 50, 0),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: riskColor.withValues(alpha: _showAnimation ? 0.1 : 0),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: riskColor.withValues(alpha: _showAnimation ? 0.5 : 0),
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: _showAnimation ? 1.0 : 0.0,
                      child: Icon(
                        _getRiskIcon(_result.level),
                        size: 64,
                        color: riskColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Risk Level: ${_result.level}",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: riskColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: riskColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Score: ${_result.score} / 23',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colors.surface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // PCOS Type Hint Card
              if (_result.pcosTypeHint != null) ...[
                Container(
                  decoration: BoxDecoration(
                    color: colors.primaryContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.lightbulb_outline, color: colors.primary, size: 28),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              loc.pcos_type_hint(_getPcosTypeName(loc, _result.pcosTypeHint!)),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: colors.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _getPcosTypeDesc(loc, _result.pcosTypeHint!),
                              style: TextStyle(
                                fontSize: 14,
                                color: colors.onPrimaryContainer.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],

              // Explanation
              Text(
                _result.explanation,
                style: TextStyle(
                  fontSize: 16,
                  color: colors.onSurface,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              // Recommendations Title
              Text(
                loc.recommendations,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 16),

              // Recommendations List
              ..._result.recommendations.map((key) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.chevron_right, color: colors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _getRecommendation(loc, key),
                          style: TextStyle(
                            fontSize: 16,
                            color: colors.onSurface.withValues(alpha: 0.9),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 48),

              // Action Buttons
              ElevatedButton(
                onPressed: () {
                  context.push('/tracker');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  loc.continue_tracking,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  context.push('/report');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.primary,
                  side: BorderSide(color: colors.primary, width: 2),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  loc.btn_generate_report,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
