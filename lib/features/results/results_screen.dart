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
  bool _isGenerating = false;

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

  void _generateReport() async {
    setState(() => _isGenerating = true);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: kAccent),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      Navigator.pop(context); // Close loader
      setState(() => _isGenerating = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Report generated successfully!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: kBackground,
      // ── 1. AppBar ──────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: kTextPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.results_title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      // ── Body: CustomScrollView + Slivers (never SingleChildScrollView) ─
      body: CustomScrollView(
        slivers: [
          // ── 2. Hero Risk Banner ──────────────────────────────────
          const SliverToBoxAdapter(
            child: RiskBanner(riskLevel: 2), // High Risk for demo
          ),

          // ── 3. "What this means" Card ────────────────────────────
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kPurpleCard,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.lightbulb_outline, color: kAccent),
                          const SizedBox(width: 8),
                          Text(
                            l10n.what_this_means,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Your symptoms show patterns common in Insulin Resistant PCOS. This is often linked to metabolic shifts.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: kTextPrimary,
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
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 12),
              child: Text(
                l10n.what_to_do_next,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: kTextSecondary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),

          // ── 4. Staggered Action Items ────────────────────────────
          const SliverToBoxAdapter(
            child: StaggeredActionItem(
              index: 0,
              title: "Check Glucose",
              subtitle: "Best done fasting in the morning.",
              bgColor: kYellowCard,
            ),
          ),
          const SliverToBoxAdapter(
            child: StaggeredActionItem(
              index: 1,
              title: "Gentle Movement",
              subtitle: "A 20-min walk can help stabilize insulin.",
              bgColor: kGreenCard,
            ),
          ),
          const SliverToBoxAdapter(
            child: StaggeredActionItem(
              index: 2,
              title: "High-Protein Snack",
              subtitle: "Helps prevent late-day energy crashes.",
              bgColor: Colors.white,
            ),
          ),

          // ── 5. Generate Report CTA ───────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
              child: OvyaButton(
                text: l10n.generate_report,
                icon: Icons.description_outlined,
                backgroundColor: kTextPrimary,
                onPressed: _generateReport,
                isLoading: _isGenerating,
              ),
            ),
          ),

          // ── 6. "Continue Tracking Symptoms" text button ──────────
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    l10n.continue_tracking,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: kAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom padding
          const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
        ],
      ),
    );
  }
}
