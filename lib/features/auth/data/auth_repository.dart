import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/services/queue_service.dart';
import '../../../core/sync/sync_service.dart';

/// Abstract repository for authentication operations.
abstract class AuthRepository {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signOut();
  Future<bool> isAuthenticated();
}

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final QueueService _queueService;
  final SyncService _syncService;
  final SharedPreferences _prefs;

  FirebaseAuthRepository({
    FirebaseAuth? firebaseAuth,
    QueueService? queueService,
    SyncService? syncService,
    required SharedPreferences prefs,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _queueService = queueService ?? QueueService(),
        _syncService = syncService ?? SyncService(),
        _prefs = prefs;

  @override
  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _handlePostLoginSync();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided.');
      }
      throw Exception(e.message ?? 'An error occurred during sign in.');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  @override
  Future<void> signUpWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _handlePostLoginSync();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception(e.message ?? 'An error occurred during sign up.');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      
      if (googleUser == null) {
        return; // User cancelled
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      await _handlePostLoginSync();
    } catch (e) {
      debugPrint('Google Sign-In error: $e');
      throw Exception('Failed to sign in with Google: $e');
    }
  }


  Future<void> signOut() async {
    // Clear queue FIRST — prevents cross-user data leakage
    await _queueService.clearAll();
    debugPrint('[Auth] Queue cleared on logout');
    await _firebaseAuth.signOut();
  }

  @override
  Future<bool> isAuthenticated() async {
    return _firebaseAuth.currentUser != null;
  }

  Future<void> _handlePostLoginSync() async {
    final hasPending = await _queueService.hasPendingItems();

    if (hasPending) {
      final user = _firebaseAuth.currentUser;
      final isNewAccount = user?.metadata.creationTime
          ?.isAfter(DateTime.now().subtract(const Duration(minutes: 5)))
          ?? false;

      if (isNewAccount) {
        // Their data — sync immediately, no dialog needed
        debugPrint('[Auth] New account — syncing offline data immediately');
        await _syncService.syncNow();
      } else {
        // Returning user — store pending flag for UI to pick up
        await _prefs.setBool('pending_sync_confirmation', true);
      }
    }
  }
}
