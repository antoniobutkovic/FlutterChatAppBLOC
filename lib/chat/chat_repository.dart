import 'package:flutter_chat_app/api/api_service.dart';

abstract class ChatRepository {}

class ChatRepositoryImpl implements ChatRepository {
  ApiService service;

  ChatRepositoryImpl(this.service);
}
