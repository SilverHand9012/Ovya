import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../../shared/providers/locale_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  String? _selectedLanguageCode;

  final List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English', 'englishName': 'English'},
    {'code': 'hi', 'name': 'हिन्दी', 'englishName': 'Hindi'},
    {'code': 'kn', 'name': 'ಕನ್ನಡ', 'englishName': 'Kannada'},
    {'code': 'mr', 'name': 'मराठी', 'englishName': 'Marathi'},
    {'code': 'te', 'name': 'తెలుగు', 'englishName': 'Telugu'},
  ];

  Future<void> _handleSelection(String code) async {
    setState(() {
      _selectedLanguageCode = code;
    });

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_locale', code);

    // Update app locale via Riverpod to immediately trigger UI translation
    ref.read(localeProvider.notifier).state = Locale(code);
  }

  void _handleContinue() {
    if (_selectedLanguageCode != null) {
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    // Use a soft rose/lavender theme interpretation leveraging the Material 3 ColorScheme.
    final primaryColor = colors.primary;
    final backgroundColor = colors.surface;
    final surfaceColor = colors.surfaceContainerHighest;
    final onSurfaceColor = colors.onSurface;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo placeholder text
              Text(
                loc.appTitle, // 'Ovya'
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              
              // Subtitle
              Text(
                'Choose your language / अपनी भाषा चुनें',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: onSurfaceColor.withOpacity(0.7),
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
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: BoxDecoration(
                          color: isSelected 
                              ? primaryColor.withOpacity(0.1) 
                              : surfaceColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? primaryColor : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    lang['name']!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                      color: isSelected ? primaryColor : onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    lang['englishName']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: onSurfaceColor.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.radio_button_checked,
                                color: primaryColor,
                                size: 28,
                              )
                            else
                              Icon(
                                Icons.radio_button_unchecked,
                                color: onSurfaceColor.withOpacity(0.3),
                                size: 28,
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
              ElevatedButton(
                onPressed: _selectedLanguageCode == null ? null : _handleContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: colors.onPrimary,
                  disabledBackgroundColor: onSurfaceColor.withOpacity(0.12),
                  disabledForegroundColor: onSurfaceColor.withOpacity(0.38),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  loc.continueText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
