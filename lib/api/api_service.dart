import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  ApiService(this.auth, this.firestore);

  Future<UserCredential> login(String email, String password) async {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register(String email, String password) async {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  sendMessage(String messageText, String sender) async {
    firestore.collection('messages').add({
      'text': messageText,
      'sender': auth.currentUser.email,
      'time': DateTime.now(),
    });
  }

  Stream<QuerySnapshot> getMessages() {
    return firestore.collection('messages').snapshots();
  }

  User getCurrentUser() {
    return auth.currentUser;
  }
}
