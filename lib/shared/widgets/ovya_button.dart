import 'package:flutter/material.dart';
import '../../app/theme.dart';

/// Reusable CTA button with loading state, used across all screens.
/// Follows design system: radius 30, full width, kAccent fill, white text.
class OvyaButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isComplete;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const OvyaButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isComplete = false,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? kAccent;
    final fgColor = foregroundColor ?? Colors.white;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (isLoading || isComplete) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          disabledBackgroundColor: bgColor.withValues(alpha: 0.85),
          disabledForegroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isComplete
              ? const Icon(Icons.check, key: ValueKey('complete'))
              : isLoading
                  ? const SizedBox(
                      key: ValueKey('loading'),
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      key: const ValueKey('idle'),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          Icon(icon),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          text,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
