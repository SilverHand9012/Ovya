/// Abstract repository for authentication operations.
abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<bool> isAuthenticated();
}
