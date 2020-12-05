import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/auth/api_service.dart';
import 'package:flutter_chat_app/auth/auth_repository.dart';
import 'package:flutter_chat_app/disposable.dart';

class AuthBloc implements Disposable {
  AuthBloc(this.repository, this.service);

  AuthRepository repository;
  ApiService service;

  StreamController<UserCredential> _user = StreamController<UserCredential>();
  Stream<UserCredential> get user => _user.stream;

  void login(String email, String password) async {
    var user = await repository.login(email, password);
    _user.add(user);
  }

  void register(String email, String password) async {
    var user = await repository.register(email, password);
    _user.add(user);
  }

  @override
  void dispose() {
    _user.close();
  }
}