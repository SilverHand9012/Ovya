import 'package:flutter/material.dart';
import '../../../app/theme.dart';

class StaggeredActionItem extends StatefulWidget {
  final int index;
  final String title;
  final String subtitle;
  final Color bgColor;
  final Widget? illustration;

  const StaggeredActionItem({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.bgColor,
    this.illustration,
  });

  @override
  State<StaggeredActionItem> createState() => _StaggeredActionItemState();
}

class _StaggeredActionItemState extends State<StaggeredActionItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    Future.delayed(Duration(milliseconds: widget.index * 120), () {
      if (mounted) {
        _controller.forward();
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
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 1),
          ),
          child: Stack(
            children: [
              if (widget.illustration != null)
                Positioned(
                  left: -10,
                  bottom: -10,
                  child: widget.illustration!,
                ),
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: kAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${widget.index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontSize: 16,
                              ),
                        ),
                        Text(
                          widget.subtitle,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: kTextSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
