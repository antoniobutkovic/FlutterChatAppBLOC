import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/utils/api_response.dart';

class ApiService {
  FirebaseAuth auth;

  ApiService(this.auth);

  Future<UserCredential> login(String email, String password) async {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register(String email, String password) async {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
