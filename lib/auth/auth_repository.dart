import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/auth/api_service.dart';
import 'package:flutter_chat_app/utils/api_response.dart';

abstract class AuthRepository {
  Future register(String email, String password);

  Future login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  ApiService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<ApiResponse<UserCredential>> login(
      String email, String password) async {
    return service.login(email, password);
  }

  @override
  Future<ApiResponse<UserCredential>> register(
      String email, String password) async {
    return service.register(email, password);
  }
}
