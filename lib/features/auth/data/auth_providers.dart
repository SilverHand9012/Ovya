import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_repository.dart';
import '../../../core/services/queue_service.dart';
import '../../../core/sync/sync_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(); // Should be overridden in main.dart
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final prefs = ref.watch(sharedPreferencesProvider);
  
  return FirebaseAuthRepository(
    firebaseAuth: firebaseAuth,
    prefs: prefs,
  );
});
