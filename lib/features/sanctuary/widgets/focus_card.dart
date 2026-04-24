import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme.dart';

class FocusCard extends StatefulWidget {
  final String title;
  final Color bgColor;
  final String route;
  final Widget? illustration;

  const FocusCard({
    super.key,
    required this.title,
    required this.bgColor,
    required this.route,
    this.illustration,
  });

  @override
  State<FocusCard> createState() => _FocusCardState();
}

class _FocusCardState extends State<FocusCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        Future.delayed(const Duration(milliseconds: 120), () {
          if (context.mounted) {
            context.push(widget.route);
          }
        });
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.6), width: 1),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (widget.illustration != null)
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: RepaintBoundary(child: widget.illustration!),
                ),
              const Positioned(
                right: 16,
                bottom: 16,
                child: Icon(Icons.north_east, size: 18, color: kTextSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
