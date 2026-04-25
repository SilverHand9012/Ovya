import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import '../../app/theme.dart';
import 'widgets/sync_badge.dart';
import 'widgets/risk_alert_card.dart';
import 'widgets/focus_card.dart';
import 'widgets/mindful_moment_card.dart';
import '../../../main.dart';

class SanctuaryScreen extends ConsumerStatefulWidget {
  const SanctuaryScreen({super.key});

  @override
  ConsumerState<SanctuaryScreen> createState() => _SanctuaryScreenState();
}

class _SanctuaryScreenState extends ConsumerState<SanctuaryScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // TODO: Wire up actual providers later
    final String userName = "Priya"; // ref.watch(userProvider.select((u) => u.name));
    final bool showRiskAlert = true; // ref.watch(riskProvider) ...

    return Scaffold(
      backgroundColor: kBackground,
      body: CustomScrollView(
        slivers: [
          // ── 1. AppBar ──────────────────────────────────────────
          SliverAppBar(
            pinned: false,
            floating: true,
            backgroundColor: kBackground,
            elevation: 0,
            leading: const SizedBox.shrink(),
            leadingWidth: 0,
            centerTitle: true,
            title: const Text(
              "Ovya",
              style: TextStyle(
                fontFamily: 'Baloo 2',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: kTextPrimary,
              ),
            ),
            actions: [
              PopupMenuButton<String>(
                icon: const Icon(Icons.language, color: kTextPrimary),
                tooltip: 'Change Language',
                onSelected: (String code) async {
                  await languageService.changeLanguage(code);
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(value: 'en', child: Text('English')),
                  const PopupMenuItem<String>(value: 'hi', child: Text('हिन्दी')),
                  const PopupMenuItem<String>(value: 'kn', child: Text('ಕನ್ನಡ')),
                  const PopupMenuItem<String>(value: 'mr', child: Text('मराठी')),
                  const PopupMenuItem<String>(value: 'te', child: Text('తెలుగు')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: kAccent,
                  child: Text(
                    userName.isNotEmpty ? userName[0].toUpperCase() : '?',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          
          // ── 2. Greeting Section ────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.greeting_morning,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: kTextSecondary,
                        ),
                      ),
                      Text(
                        "$userName \u{1F338}",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: kTextPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SyncBadge(),
                ],
              ),
            ),
          ),
          
          // ── 4. Risk Alert Card (conditional) ───────────────────
          if (showRiskAlert)
            const SliverToBoxAdapter(
              child: RiskAlertCard(isHighRisk: true),
            ),
            
          // ── 5. "Today's Focus" Section Header ──────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Text(
                l10n.todays_focus,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: kTextPrimary,
                ),
              ),
            ),
          ),
          
          // ── 6. Focus Grid ──────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildListDelegate([
                FocusCard(
                  title: l10n.log_today,
                  bgColor: kPurpleCard,
                  route: '/log',
                  illustration: Image.asset(
                    'assets/images/illustrations/hand.png',
                    width: 165,
                    height: 165,
                    fit: BoxFit.contain,
                  ),
                ),
                FocusCard(
                  title: l10n.doctor_report,
                  bgColor: kYellowCard,
                  route: '/report',
                  illustration: Image.asset(
                    'assets/images/illustrations/face1.png',
                    width: 165,
                    height: 165,
                    fit: BoxFit.contain,
                  ),
                ),
                FocusCard(
                  title: l10n.ask_ovya,
                  bgColor: kGreenCard,
                  route: '/chat',
                  illustration: Image.asset(
                    'assets/images/illustrations/face2.png',
                    width: 165,
                    height: 165,
                    fit: BoxFit.contain,
                  ),
                ),
                FocusCard(
                  title: l10n.my_history,
                  bgColor: Colors.white,
                  route: '/history',
                  illustration: Image.asset(
                    'assets/images/illustrations/flower1.png',
                    width: 165,
                    height: 165,
                    fit: BoxFit.contain,
                  ),
                ),
              ]),
            ),
          ),
          
          // ── Cycle Tracking Full-width Card ─────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: InkWell(
                onTap: () => context.push('/cycle'),
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBF0), // Soft pink/red
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: kAccent.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.water_drop, color: Color(0xFFFF6B6B)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Track Cycle',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Log your period dates',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: kTextSecondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16, color: kTextSecondary),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // ── 7. "Mindful Moment" Section ────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
              child: Text(
                l10n.mindful_moment,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: kTextPrimary,
                ),
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: MindfulMomentCard(
                title: l10n.mindful_ashwagandha_title,
                description: l10n.mindful_ashwagandha_desc,
              ),
            ),
          ),
          

          // Bottom padding — enough clearance for floating navbar
          const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
        ],
      ),
      // ── 8. Bottom Nav is now in HomeShell (IndexedStack) ─────
    );
  }
}
