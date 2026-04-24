import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'app/router.dart';
import 'app/theme.dart';
import 'core/isar/isar_service.dart';
import 'core/sync/sync_service.dart';
import 'core/services/language_service.dart';
import 'core/connectivity/connectivity_orchestrator.dart';
import 'shared/providers/connectivity_provider.dart';
import 'shared/providers/sync_service_provider.dart';

/// Global language service instance — initialised before runApp.
final languageService = LanguageService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Enable offline persistence
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);

  // 1. Open the local Isar database.
  final isarService = IsarService();
  await isarService.db;

  // 2. Load persisted language preference.
  await languageService.load();

  // 3. Initialize connectivity orchestrator safely before anything else
  final connectivityOrchestrator = ConnectivityOrchestrator();

  // 4. Start the background sync service.
  final container = ProviderContainer(
    overrides: [
      connectivityOrchestratorProvider.overrideWithValue(connectivityOrchestrator),
    ],
  );
  
  final syncService = SyncService(
    ref: container,
    orchestrator: connectivityOrchestrator,
  );

  final mainContainer = ProviderContainer(
    parent: container,
    overrides: [
      syncServiceProvider.overrideWithValue(syncService),
    ],
  );
  
  syncService.start();

  runApp(
    UncontrolledProviderScope(
      container: mainContainer,
      child: const OvyaApp(),
    ),
  );
}

class OvyaApp extends StatefulWidget {
  const OvyaApp({super.key});

  @override
  State<OvyaApp> createState() => _OvyaAppState();
}

class _OvyaAppState extends State<OvyaApp> {
  @override
  void initState() {
    super.initState();
    languageService.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    languageService.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged() {
    setState(() {}); // Rebuild with new locale.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ovya',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(languageService.locale),
      themeMode: ThemeMode.light,
      routerConfig: appRouter,

      // ── Localization ──────────────────────────────────────
      locale: languageService.locale,
      supportedLocales: LanguageService.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
