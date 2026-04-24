import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

class SyncBadge extends StatefulWidget {
  const SyncBadge({super.key});

  @override
  State<SyncBadge> createState() => _SyncBadgeState();
}

class _SyncBadgeState extends State<SyncBadge> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isSyncing = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    // Simulate initial sync for 2.5s
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          _isSyncing = false;
        });
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return RepaintBoundary(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: kSyncGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_isSyncing)
              RotationTransition(
                turns: _controller,
                child: const Icon(Icons.sync, size: 12, color: kAccentDeep),
              )
            else
              const Icon(Icons.check_circle_outline, size: 12, color: kAccentDeep),
            const SizedBox(width: 4),
            Text(
              _isSyncing ? l10n.syncing : l10n.synced_just_now,
              style: const TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: kAccentDeep,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
