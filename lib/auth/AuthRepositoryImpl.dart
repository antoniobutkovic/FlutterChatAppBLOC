import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/auth/ApiService.dart';
import 'package:flutter_chat_app/auth/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  ApiService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<UserCredential> login(String email, String password) async {
    return service.login(email, password);
  }

  @override
  Future register() {
    return null;
  }
}
