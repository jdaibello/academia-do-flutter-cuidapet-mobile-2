abstract class UserRepository {
  Future<void> register(String email, String password);
  Future<String> loginWithEmailAndPassword(String email, String password);
}
