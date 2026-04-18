import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// Remote data source for symptom data (Firestore sync).
class SymptomRemoteDatasource {
  final FirebaseFirestore _firestore;

  SymptomRemoteDatasource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Returns a stream of symptom logs ordered by timestamp descending.
  Stream<List<Map<String, dynamic>>> watchSymptomLogs(String userId) {
    debugPrint("[Firestore] Fetching symptomLogs ordered by timestamp DESC");
    
    return _firestore
        .collection('users')
        .doc(userId) // Usually 'demo_user' for now
        .collection('symptomLogs')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        
        // Handle potentially null serverTimestamp
        final ts = data['timestamp'];
        final date = ts != null ? (ts as Timestamp).toDate() : DateTime.now();
        
        data['id'] = doc.id;
        data['timestamp'] = date.toIso8601String(); // Standardize format for UI
        return data;
      }).toList();
    });
  }
}

