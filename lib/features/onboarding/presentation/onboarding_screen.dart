import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../../main.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  String? _selectedLanguageCode;

  final List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English', 'englishName': 'English', 'font': 'Baloo 2'},
    {'code': 'hi', 'name': 'हिन्दी', 'englishName': 'Hindi', 'font': 'Baloo 2'},
    {'code': 'mr', 'name': 'मराठी', 'englishName': 'Marathi', 'font': 'Baloo 2'},
    {'code': 'kn', 'name': 'ಕನ್ನಡ', 'englishName': 'Kannada', 'font': 'Baloo Tamma 2'},
    {'code': 'te', 'name': 'తెలుగు', 'englishName': 'Telugu', 'font': 'Baloo Tammudu 2'},
  ];

  String _getSubtitle(String? code) {
    switch (code) {
      case 'hi': return 'अपनी भाषा चुनें';
      case 'mr': return 'तुमची भाषा निवडा';
      case 'kn': return 'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';
      case 'te': return 'మీ భాషను ఎంచుకోండి';
      default: return 'Choose your language';
    }
  }

  Future<void> _handleSelection(String code) async {
    setState(() {
      _selectedLanguageCode = code;
    });

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', code);

    // Update app locale via global language service
    await languageService.changeLanguage(code);
  }

  void _handleContinue() {
    if (_selectedLanguageCode != null) {
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Colors based on the mockup
    const backgroundColor = Color(0xFFFFE8E3); // Soft peach/pink
    const darkTextColor = Color(0xFF2C1A2E); // Dark purple/brown
    const selectedBgColor = Color(0xFFEBE6FC); // Light purple
    const selectedTextColor = Color(0xFF4B32A4); // Deep purple
    const unselectedIconColor = Color(0xFFC7C1D3); // Greyish purple

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFEAE6),
              Color(0xFFFFDFDF),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                
                // Logo
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Title
                const Text(
                  'Ovya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Baloo 2',
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: darkTextColor,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Subtitle
                Text(
                  _getSubtitle(_selectedLanguageCode),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: _languages.firstWhere(
                      (l) => l['code'] == (_selectedLanguageCode ?? 'en'),
                      orElse: () => _languages.first,
                    )['font'],
                    fontSize: 18,
                    color: darkTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                const SizedBox(height: 48),

                // Language List
                Expanded(
                  child: ListView.separated(
                    itemCount: _languages.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final lang = _languages[index];
                      final isSelected = _selectedLanguageCode == lang['code'];

                      return InkWell(
                        onTap: () => _handleSelection(lang['code']!),
                        borderRadius: BorderRadius.circular(20),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          decoration: BoxDecoration(
                            color: isSelected ? selectedBgColor : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                lang['name']!,
                                style: TextStyle(
                                  fontFamily: lang['font'],
                                  fontSize: 18,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                                  color: isSelected ? selectedTextColor : darkTextColor,
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle,
                                  color: selectedTextColor,
                                  size: 24,
                                )
                              else
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: unselectedIconColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Continue Button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6B5B95), Color(0xFF8878B5)],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6B5B95).withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _selectedLanguageCode == null ? null : _handleContinue,
                      borderRadius: BorderRadius.circular(28),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.continueText,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
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
