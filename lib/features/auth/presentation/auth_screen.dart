import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import '../../onboarding/providers/onboarding_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  bool _isLoading = false;

  Future<void> _handleGuestLogin() async {
    setState(() => _isLoading = true);
    
    try {
      await FirebaseAuth.instance.signInAnonymously().timeout(const Duration(seconds: 3));
    } catch (e) {
      debugPrint("Guest login failed: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Firebase Auth failed, continuing as offline guest...')),
        );
      }
    }
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_guest', true);
    
    // Explicitly read the onboarding status to fetch from Firestore if it exists
    await ref.read(onboardingStatusProvider.future);
    
    if (!mounted) return;
    setState(() => _isLoading = false);
    
    if (prefs.containsKey('selected_language')) {
      context.go('/');
    } else {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFFFDDE6), // Soft pastel pink background
      body: Stack(
        children: [
          // Background curves
          Positioned.fill(
            child: CustomPaint(
              painter: _CurvedBackgroundPainter(),
            ),
          ),
          
          SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  
                  // Circular Image Container
                  Container(
                    width: size.width * 0.6,
                    height: size.width * 0.6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/illustrations/flower1.png', // Placeholder for the actual image
                        width: size.width * 0.45,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // Title
                  Text(
                    loc.auth_welcome_title,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF33001B), // Very dark burgundy/purple
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Subtitle
                  Text(
                    loc.auth_welcome_subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5D2E46), // Dark desaturated pink/purple
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const Spacer(flex: 3),
                  
                  // Email Button
                  _PrimaryButton(
                    onTap: () {
                      context.push('/login');
                    },
                    isLoading: false,
                    label: loc.auth_login_signup_btn,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6B5B95), Color(0xFF8878B5)],
                    ),
                    textColor: Colors.white,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Guest Button
                  _PrimaryButton(
                    onTap: _handleGuestLogin,
                    isLoading: false,
                    label: loc.auth_guest_btn,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE4E0FA), Color(0xFFD4CFF0)],
                    ),
                    textColor: const Color(0xFF2C1A2E),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Bottom security text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock_outline, size: 14, color: Color(0xFF7A4A62)),
                      const SizedBox(width: 6),
                      Text(
                        loc.auth_private_secure,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF7A4A62).withValues(alpha: 0.8),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                ],
              ),
                ),
                // Back Button
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2C1A2E)),
                    onPressed: () => context.go('/onboarding'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Gradient gradient;
  final Color textColor;
  final Widget? icon;
  final bool isLoading;

  const _PrimaryButton({
    required this.onTap,
    required this.label,
    required this.gradient,
    required this.textColor,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: BorderRadius.circular(28),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: textColor,
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        icon!,
                        const SizedBox(width: 12),
                      ],
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // A simple approximation of the Google "G" icon using a colored rich text or an icon
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(text: 'G', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

class _CurvedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD49CAE).withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path1 = Path()
      ..moveTo(0, size.height * 0.4)
      ..quadraticBezierTo(size.width * 0.4, size.height * 0.5, size.width, size.height * 0.3);

    final path2 = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.9, size.width, size.height * 0.6);

    final path3 = Path()
      ..moveTo(size.width * 0.2, size.height)
      ..quadraticBezierTo(size.width * 0.6, size.height * 0.6, size.width * 0.9, 0);
      
    final path4 = Path()
      ..moveTo(0, size.height * 0.1)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.2, size.width, size.height * 0.05);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
    canvas.drawPath(path3, paint);
    canvas.drawPath(path4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
