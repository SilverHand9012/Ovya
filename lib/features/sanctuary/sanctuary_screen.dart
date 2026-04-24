import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import '../../app/theme.dart';
import 'widgets/sync_badge.dart';
import 'widgets/risk_alert_card.dart';
import 'widgets/focus_card.dart';
import 'widgets/mindful_moment_card.dart';
import '../../shared/providers/locale_provider.dart';
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
            leading: IconButton(
              icon: const Icon(Icons.menu, color: kTextPrimary),
              onPressed: () {
                // Drawer placeholder
              },
            ),
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
                ),
                FocusCard(
                  title: l10n.doctor_report,
                  bgColor: kYellowCard,
                  route: '/report',
                ),
                FocusCard(
                  title: l10n.ask_ovya,
                  bgColor: Colors.white,
                  route: '/chat',
                ),
                FocusCard(
                  title: l10n.my_history,
                  bgColor: Colors.white,
                  route: '/history',
                ),
              ]),
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
          
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: MindfulMomentCard(
                title: "Ashwagandha Tea",
                description: "Known to help lower cortisol levels and balance hormones.",
              ),
            ),
          ),
          
          // Bottom padding
          const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
        ],
      ),
      // ── 8. Bottom Nav is now in HomeShell (IndexedStack) ─────
    );
  }
}
