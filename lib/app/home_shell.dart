import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/sanctuary/sanctuary_screen.dart';
import '../features/chat/presentation/chat_screen.dart';
import '../features/reports/presentation/report_screen.dart';
import 'theme.dart';

/// Provider that tracks the currently selected bottom nav tab index.
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

/// HomeShell — wraps tab-based screens with a persistent custom
/// BottomNavigationBar backed by [IndexedStack] so scroll positions
/// and widget state are preserved across tab switches (prompt rule #5).
class HomeShell extends ConsumerWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      backgroundColor: kBackground,
      body: Stack(
        children: [
          // ── Tab content ──────────────────────────────────────
          IndexedStack(
            index: currentIndex,
            children: const [
              SanctuaryScreen(),
              _PlaceholderTab(label: 'Insights', icon: Icons.auto_graph),
            ],
          ),

          // ── Floating bottom nav bar ──────────────────────────
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: _FloatingBottomNav(
                currentIndex: currentIndex,
                onTap: (index) {
                  ref.read(bottomNavIndexProvider.notifier).state = index;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Floating pill-shaped bottom navigation with two tabs.
/// Active tab gets a dark rounded-square highlight with white icon;
/// inactive tab shows an outlined icon in dark color.
class _FloatingBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _FloatingBottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    _NavItem(Icons.home_outlined, Icons.home_rounded, 'Sanctuary'),
    _NavItem(Icons.grid_view_outlined, Icons.grid_view_rounded, 'Insights'),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(_items.length, (i) {
            final isActive = currentIndex == i;
            final item = _items[i];
            return GestureDetector(
              onTap: () => onTap(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutCubic,
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isActive ? kTextPrimary : Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: Icon(
                      isActive ? item.activeIcon : item.icon,
                      key: ValueKey('${item.label}_$isActive'),
                      color: isActive ? Colors.white : kTextSecondary,
                      size: 26,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem(this.icon, this.activeIcon, this.label);
}

/// Placeholder screen for tabs that haven't been built yet.
class _PlaceholderTab extends StatelessWidget {
  final String label;
  final IconData icon;
  const _PlaceholderTab({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: kTextSecondary),
            const SizedBox(height: 16),
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: kTextSecondary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Coming soon',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: kTextSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
