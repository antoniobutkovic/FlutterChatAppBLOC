import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_app/utils/disposable.dart';
import 'package:flutter_chat_app/widgets/message_bubble.dart';
import 'chat_repository.dart';

class ChatBloc implements Disposable {
  ChatBloc(this.repository);

  ChatRepository repository;

  sendMessage(String messageText, String sender) {
    repository.sendMessage(messageText, sender);
  }

  Stream<QuerySnapshot> getMessages() {
    return repository.getMessages();
  }

  @override
  void dispose() {}

  MessageBubble mapData(QueryDocumentSnapshot message) {
    String messageText = message.data()['text'];
    String sender = message.data()['sender'];
    String currentUserEmail = repository.getCurrentUser().email;

    return MessageBubble(
      messageText,
      sender,
      sender == currentUserEmail,
    );
  }
}
