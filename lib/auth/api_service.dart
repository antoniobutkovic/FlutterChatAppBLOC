import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/utils/api_response.dart';

class ApiService {
  FirebaseAuth auth;

  ApiService(this.auth);

  login(String email, String password) async {
    try {
      return ApiResponse.completed(
          auth.signInWithEmailAndPassword(email: email, password: password));
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  register(String email, String password) async {
    try {
      return auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
