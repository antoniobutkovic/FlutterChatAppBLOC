import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  FirebaseAuth auth;

  ApiService(this.auth);

  Future<UserCredential> login(String email, String password) async {
    try {
      return auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
