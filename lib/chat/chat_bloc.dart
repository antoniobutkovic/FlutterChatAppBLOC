import 'package:flutter_chat_app/utils/disposable.dart';

import 'chat_repository.dart';

class ChatBloc implements Disposable {
  ChatBloc(this.repository);

  ChatRepository repository;

  @override
  void dispose() {}

  sendMessage(String messageText, String sender) {
    repository.sendMessage(messageText, sender);
  }
}
