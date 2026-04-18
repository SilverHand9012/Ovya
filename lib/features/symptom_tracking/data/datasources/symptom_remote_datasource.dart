/// Remote data source for symptom tracking.
/// Firestore writes are currently handled via SyncService + Queue system.
/// This class exists for architectural clarity and future extensibility.

class SymptomRemoteDataSource {
  // Future: direct Firestore abstraction if needed
}
