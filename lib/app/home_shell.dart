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
      body: IndexedStack(
        index: currentIndex,
        children: const [
          SanctuaryScreen(),
          _PlaceholderTab(label: 'Insights', icon: Icons.auto_graph),
          _PlaceholderTab(label: 'Journal', icon: Icons.book),
          _PlaceholderTab(label: 'Profile', icon: Icons.person),
        ],
      ),
      bottomNavigationBar: _OvyaBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}

/// Custom BottomNavigationBar — avoids Flutter's default BottomNavigationBar
/// which triggers full rebuilds.  Uses a simple Row of tappable icons
/// with an animated dot indicator above the active tab.
class _OvyaBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _OvyaBottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  static const _items = [
    _NavItem(Icons.spa_outlined, Icons.spa, 'Sanctuary'),
    _NavItem(Icons.auto_graph_outlined, Icons.auto_graph, 'Insights'),
    _NavItem(Icons.book_outlined, Icons.book, 'Journal'),
    _NavItem(Icons.person_outline, Icons.person, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE), width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (i) {
              final isActive = currentIndex == i;
              final item = _items[i];
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(i),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Dot indicator above icon
                      AnimatedOpacity(
                        opacity: isActive ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: kAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        color: isActive ? kAccent : kTextSecondary,
                        size: 24,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontFamily: 'Baloo 2',
                          fontSize: 11,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                          color: isActive ? kAccent : kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
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
