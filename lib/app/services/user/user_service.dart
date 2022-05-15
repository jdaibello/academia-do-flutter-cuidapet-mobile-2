abstract class UserService {
  Future<void> register(String email, String password);
  Future<void> loginWithEmailAndPassword(String email, String password);
}
