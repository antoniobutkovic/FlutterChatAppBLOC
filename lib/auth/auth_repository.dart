import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/auth/api_service.dart';

abstract class AuthRepository {
  Future register(String email, String password);

  Future login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  ApiService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<UserCredential> login(String email, String password) async {
    return service.login(email, password);
  }

  @override
  Future register(String email, String password) async {
    return service.register(email, password);
  }
}
