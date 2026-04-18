import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../../core/intelligence/detection_engine.dart';
import '../../../shared/providers/connectivity_provider.dart';
import '../providers/home_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final String _randomTip;

  @override
  void initState() {
    super.initState();
    final tips = [
      "Drink plenty of water today to stay hydrated and support your metabolism.",
      "A 15-minute walk after meals can help balance blood sugar levels.",
      "Prioritise 7-8 hours of sleep tonight to ease stress and fatigue.",
      "Adding a quick mindfulness exercise can naturally lower cortisol.",
      "Listen to your body today — rest is just as productive as tracking."
    ];
    _randomTip = tips[Random().nextInt(tips.length)];
  }

  String _getGreeting(String? firstName, AppLocalizations loc) {
    final hour = DateTime.now().hour;
    String timeGreeting = loc.home_hello;
    if (hour >= 5 && hour < 12) {
      timeGreeting = loc.home_good_morning;
    } else if (hour >= 12 && hour < 17) timeGreeting = loc.home_good_afternoon;
    else if (hour >= 17 && hour < 21) timeGreeting = loc.home_good_evening;
    
    if (firstName != null && firstName.isNotEmpty) {
      return '$timeGreeting, $firstName';
    }
    return timeGreeting;
  }

  Color _getRiskColor(String level) {
    switch (level.toLowerCase()) {
      case 'low': return const Color(0xff1D9E75);
      case 'medium': return const Color(0xffEF9F27);
      case 'high': return const Color(0xffE24B4A);
      default: return Colors.grey;
    }
  }

  String _getRelativeTime(DateTime time, AppLocalizations loc) {
    final diff = DateTime.now().difference(time);
    if (diff.inDays == 0) return loc.home_time_today;
    if (diff.inDays == 1) return loc.home_time_yesterday;
    return loc.home_time_days_ago(diff.inDays);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    final homeStateAsync = ref.watch(homeProvider);
    final isOnline = ref.watch(connectivityProvider).valueOrNull ?? true;

    if (homeStateAsync.isLoading && !homeStateAsync.hasValue) {
      return Scaffold(
        backgroundColor: colors.surface,
        body: Center(child: CircularProgressIndicator(color: colors.primary)),
      );
    }

    final state = homeStateAsync.value!;
    final nowStr = DateFormat.yMMMMd(Localizations.localeOf(context).languageCode).format(DateTime.now());

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: RefreshIndicator(
          color: colors.primary,
          onRefresh: () async {
            // refresh manually forces to run the symptom loads
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getGreeting(state.firstName, loc),
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colors.onSurface),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            nowStr,
                            style: TextStyle(fontSize: 14, color: colors.onSurface.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                    _SyncPill(isOnline: isOnline),
                  ],
                ),
                const SizedBox(height: 32),

                // Risk Result Card
                _RiskResultCard(
                  result: state.latestRiskResult, 
                  loc: loc,
                  getRelativeTime: (time) => _getRelativeTime(time, loc),
                  getRiskColor: _getRiskColor,
                ),
                const SizedBox(height: 24),

                // Primary Action Button
                ElevatedButton(
                  onPressed: () => context.go('/detection'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: colors.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.latestRiskResult == null 
                            ? loc.home_start_assessment 
                            : loc.home_rerun_assessment,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Secondary Actions Grid
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _ActionCard(
                      icon: Icons.edit_note,
                      label: loc.home_card_log,
                      subtitle: state.hasLoggedToday ? loc.home_logged_done : loc.home_logged_today,
                      onTap: () => context.go('/tracker'),
                      colors: colors,
                    ),
                    _ActionCard(
                      icon: Icons.description_outlined,
                      label: loc.home_card_report,
                      subtitle: loc.home_card_report_sub,
                      onTap: () => context.go('/report'),
                      colors: colors,
                    ),
                    _ActionCard(
                      icon: Icons.auto_awesome,
                      label: loc.home_card_ai,
                      subtitle: isOnline ? loc.home_card_ai_ready : loc.home_card_ai_offline,
                      disabled: !isOnline,
                      onTap: () {
                        if (!isOnline) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(loc.home_err_offline)),
                          );
                        } else {
                          context.go('/insights'); // Fallback path assuming /chat is /insights
                        }
                      },
                      colors: colors,
                    ),
                    _ActionCard(
                      icon: Icons.history,
                      label: loc.home_card_history,
                      subtitle: loc.home_card_history_sub,
                      onTap: () => context.go('/history'),
                      colors: colors,
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // Motivational Footer
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Icon(Icons.spa, size: 20, color: colors.primary.withOpacity(0.5)),
                        const SizedBox(height: 8),
                        Text(
                          _randomTip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: colors.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SyncPill extends StatelessWidget {
  final bool isOnline;
  const _SyncPill({required this.isOnline});

  @override
  Widget build(BuildContext context) {
    final color = isOnline ? const Color(0xff1D9E75) : const Color(0xffEF9F27);
    final text = isOnline ? 'Synced' : 'Offline';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}

class _RiskResultCard extends StatelessWidget {
  final RiskResult? result;
  final AppLocalizations loc;
  final String Function(DateTime) getRelativeTime;
  final Color Function(String) getRiskColor;

  const _RiskResultCard({
    required this.result,
    required this.loc,
    required this.getRelativeTime,
    required this.getRiskColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (result == null) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: colors.secondaryContainer.withOpacity(0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
        ),
        child: Column(
          children: [
            Icon(Icons.shield_outlined, size: 48, color: colors.primary.withOpacity(0.8)),
            const SizedBox(height: 16),
            Text(
              loc.home_empty_risk_title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              loc.home_empty_risk_sub,
              style: TextStyle(fontSize: 14, color: colors.onSurface.withOpacity(0.7)),
            ),
          ],
        ),
      );
    }

    final riskColor = getRiskColor(result!.level);

    return InkWell(
      onTap: () => context.go('/detection_result'),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [riskColor.withOpacity(0.1), riskColor.withOpacity(0.05)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: riskColor.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loc.home_pcos_risk(result!.level),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: riskColor),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: riskColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${result!.score} / 23',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
            if (result!.pcosTypeHint != null) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.lightbulb_outline, size: 16, color: riskColor),
                  const SizedBox(width: 6),
                  Text(
                    loc.home_type_hint(result!.pcosTypeHint!),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: riskColor.withOpacity(0.8)),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loc.home_last_assessed(getRelativeTime(DateTime.now())), // Ideally stored time, mocked for UI specs
                  style: TextStyle(fontSize: 12, color: colors.onSurface.withOpacity(0.6)),
                ),
                Icon(Icons.arrow_forward_ios, size: 12, color: colors.onSurface.withOpacity(0.4)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;
  final ColorScheme colors;
  final bool disabled;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
    required this.colors,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.5 : 1.0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colors.outlineVariant.withOpacity(0.5)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colors.primaryContainer.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: colors.primary, size: 24),
              ),
              const Spacer(),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: colors.onSurface),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11, color: colors.onSurface.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
