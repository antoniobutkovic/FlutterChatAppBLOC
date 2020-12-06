import 'package:flutter_chat_app/api/api_service.dart';

abstract class ChatRepository {
  sendMessage(String messageText, String sender);
}

class ChatRepositoryImpl implements ChatRepository {
  ApiService service;

  ChatRepositoryImpl(this.service);

  @override
  sendMessage(String messageText, String sender) {
    service.sendMessage(messageText, sender);
  }
}
