import 'package:flutter/material.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import '../../app/theme.dart';
import '../../shared/widgets/ovya_button.dart';
import 'widgets/risk_banner.dart';
import 'widgets/staggered_action_item.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _analysisCardController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _analysisCardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _analysisCardController,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _analysisCardController,
      curve: Curves.easeOutCubic,
    ));

    // Fade-in on screen mount with 200ms delay
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _analysisCardController.forward();
      }
    });
  }

  @override
  void dispose() {
    _analysisCardController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: kBackground,
      // ── 1. Custom AppBar for AI Insights ────────────────────────
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTextPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.results_title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kTextPrimary,
                  ),
            ),
            Text(
              l10n.results_subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: kTextSecondary,
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: kPurpleCard,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/illustrations/face1.png', // Assuming user avatar or similar placeholder
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, color: kAccent),
                ),
              ),
            ),
          ),
        ],
      ),
      // ── Body: CustomScrollView + Slivers ────────────────────────
      body: CustomScrollView(
        slivers: [
          // ── 2. Hero Risk Banner ──────────────────────────────────
          const SliverToBoxAdapter(
            child: RiskBanner(riskLevel: 2), // High Risk/Moderate for demo
          ),

          // ── 3. "What this means" Card ────────────────────────────
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E4FF), // Light purple
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.psychology, color: Color(0xFF2C1A6E)), // Dark purple icon
                          const SizedBox(width: 8),
                          Text(
                            l10n.what_this_means,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: const Color(0xFF2C1A6E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.insight_explanation_insulin,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF2C1A6E),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── 4. "What to do next" Section Header ──────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Text(
                l10n.what_to_do_next.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: kTextSecondary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),

          // ── 5. Staggered Action Items ────────────────────────────
          SliverToBoxAdapter(
            child: StaggeredActionItem(
              index: 0,
              title: l10n.action_balanced_meals_title,
              subtitle: l10n.action_balanced_meals_subtitle,
              bgColor: const Color(0xFFE8F5E9), // Light green tint instead of yellow in the mockup, or keep yellow
              illustration: null,
            ),
          ),
          SliverToBoxAdapter(
            child: StaggeredActionItem(
              index: 1,
              title: l10n.action_light_movement_title,
              subtitle: l10n.action_light_movement_subtitle,
              bgColor: const Color(0xFFE0F2F1), // Light teal
              illustration: null,
            ),
          ),
          SliverToBoxAdapter(
            child: StaggeredActionItem(
              index: 2,
              title: l10n.action_sleep_title,
              subtitle: l10n.action_sleep_subtitle,
              bgColor: Colors.white,
              illustration: null,
            ),
          ),

          // ── 6. Wellness Tip Card ───────────────────────────────
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  left: BorderSide(color: const Color(0xFF2E7D32), width: 6), // Green edge
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.eco, color: Color(0xFF2E7D32), size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kTextPrimary,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: '${l10n.wellness_tip_intro} ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: l10n.wellness_tip_body),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── 7. Ask Ovya Button ───────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: OvyaButton(
                text: l10n.ask_ovya_anything,
                icon: Icons.chat_bubble_outline,
                backgroundColor: const Color(0xFF6B52AE), // Purple button
                onPressed: () {
                  // Navigate to chat
                  Navigator.pushNamed(context, '/chat');
                },
                isLoading: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
