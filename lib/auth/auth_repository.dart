import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/api/api_service.dart';
import 'package:flutter_chat_app/utils/api_response.dart';

abstract class AuthRepository {
  Future<ApiResponse<UserCredential>> register(String email, String password);

  Future<ApiResponse<UserCredential>> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  ApiService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<ApiResponse<UserCredential>> login(
      String email, String password) async {
    try {
      UserCredential user = await service.login(email, password);
      return ApiResponse.completed(user);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<UserCredential>> register(
      String email, String password) async {
    try {
      UserCredential user = await service.register(email, password);
      return ApiResponse.completed(user);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
