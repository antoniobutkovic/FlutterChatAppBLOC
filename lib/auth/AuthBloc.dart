import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/auth/ApiService.dart';
import 'package:flutter_chat_app/auth/AuthRepository.dart';
import 'package:flutter_chat_app/disposable.dart';

class AuthBloc implements Disposable {
  AuthRepository repository;
  ApiService service;

  AuthBloc(this.repository, this.service);

  Future<UserCredential> login(String email, String password) async {
    return repository.login(email, password);
  }

  Future<UserCredential> register(String email, String password) async {
    return repository.register(email, password);
  }

  @override
  void dispose() {}
}
