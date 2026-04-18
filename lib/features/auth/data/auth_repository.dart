/// Abstract repository for authentication operations.
abstract class AuthRepository {
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> signOut();
  Future<bool> isAuthenticated();
}
