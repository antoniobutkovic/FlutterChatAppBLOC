abstract class AuthRepository {
  Future register(String email, String password);

  Future login(String email, String password);
}
