import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/api/api_service.dart';

abstract class ChatRepository {
  sendMessage(String messageText, String sender);
  Stream<QuerySnapshot> getMessages();
  User getCurrentUser();
}

class ChatRepositoryImpl implements ChatRepository {
  ApiService service;

  ChatRepositoryImpl(this.service);

  @override
  sendMessage(String messageText, String sender) {
    service.sendMessage(messageText, sender);
  }

  @override
  Stream<QuerySnapshot> getMessages() {
    return service.getMessages();
  }

  @override
  User getCurrentUser() {
    return service.getCurrentUser();
  }
}
