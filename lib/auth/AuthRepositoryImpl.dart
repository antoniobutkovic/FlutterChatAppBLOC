import 'package:flutter_chat_app/auth/AuthService.dart';
import 'package:flutter_chat_app/auth/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService service;

  AuthRepositoryImpl(this.service);

  @override
  Future login(String email, String password) async {
    print("repo $email and $password");
    return service.login(email, password);
  }

  @override
  Future register() {
    return null;
  }
}
