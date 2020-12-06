import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/auth/auth_repository.dart';
import 'package:flutter_chat_app/utils/disposable.dart';
import 'package:flutter_chat_app/utils/api_response.dart';

class AuthBloc implements Disposable {
  AuthBloc(this.repository);

  AuthRepository repository;

  StreamController<ApiResponse<UserCredential>> _user =
      StreamController<ApiResponse<UserCredential>>();
  Stream<ApiResponse<UserCredential>> get user => _user.stream;

  void login(String email, String password) async {
    _user.add(ApiResponse.loading(true));
    var user = await repository.login(email, password);
    _user.add(user);
  }

  void register(String email, String password) async {
    _user.add(ApiResponse.loading(true));
    var user = await repository.register(email, password);
    _user.add(user);
  }

  @override
  void dispose() {
    _user.close();
  }
}
