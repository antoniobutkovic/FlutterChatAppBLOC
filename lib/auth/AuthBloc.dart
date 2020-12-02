import 'package:flutter_chat_app/auth/AuthService.dart';
import 'package:flutter_chat_app/auth/AuthRepository.dart';
import 'package:flutter_chat_app/disposable.dart';

class AuthBloc implements Disposable {
  AuthRepository repository;
  AuthService service;

  AuthBloc(this.repository, this.service);

  void login(String email, String password) async {
    repository.login(email, password);
  }

  @override
  void dispose() {}
}
