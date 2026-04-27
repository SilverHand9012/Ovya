import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/services/queue_service.dart';
import '../../../shared/providers/sync_service_provider.dart';

final onboardingStatusProvider = FutureProvider<bool>((ref) async {
  final user = FirebaseAuth.instance.currentUser;
  final prefs = await SharedPreferences.getInstance();
  final uid = user?.uid ?? 'guest';
  final localKey = 'has_completed_assessment_$uid';

  // 1. Check local cache first (for offline-first behavior)
  if (prefs.containsKey(localKey)) {
    return prefs.getBool(localKey) ?? false;
  }

  // 2. If no local cache, try fetching from Firestore
  if (user == null) {
    // For offline guests without a cache, default to false
    return false;
  }

  try {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (!doc.exists) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'hasCompletedAssessment': false,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      await prefs.setBool(localKey, false);
      return false;
    }

    final hasCompleted = doc.data()?['hasCompletedAssessment'] ?? false;
    await prefs.setBool(localKey, hasCompleted);
    return hasCompleted;
  } catch (e) {
    // If offline and no local cache, default to false (needs onboarding)
    return false;
  }
});

class OnboardingController {
  static Future<void> markAssessmentComplete(String userId, WidgetRef ref) async {
    final prefs = await SharedPreferences.getInstance();
    final localKey = 'has_completed_assessment_$userId';
    await prefs.setBool(localKey, true);

    if (userId != 'guest') {
      try {
        final queueService = QueueService();
        await queueService.enqueue(
          action: 'update_profile',
          payload: {
            'hasCompletedAssessment': true,
            'updatedAt': DateTime.now().toIso8601String(),
          },
        );

        // Trigger sync
        final syncService = ref.read(syncServiceProvider);
        await syncService.syncPendingData();
      } catch (_) {
        // Ignore sync errors for now so UI can proceed
      }
    }

    ref.invalidate(onboardingStatusProvider);
    ref.invalidate(userNameProvider);
  }
}

final userNameProvider = FutureProvider<String>((ref) async {
  final user = FirebaseAuth.instance.currentUser;
  final prefs = await SharedPreferences.getInstance();
  
  // 1. Check SharedPreferences first (where we just saved it in WelcomeScreen)
  final savedName = prefs.getString('user_name');
  if (savedName != null && savedName.isNotEmpty) {
    return savedName;
  }
  
  // 2. Fallback to Firebase Display Name
  if (user?.displayName != null && user!.displayName!.isNotEmpty) {
    return user.displayName!;
  }
  
  return "User";
});
