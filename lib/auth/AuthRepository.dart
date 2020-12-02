abstract class AuthRepository {
  Future register();

  Future login(String email, String password);
}
