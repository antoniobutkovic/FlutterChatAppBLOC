import 'package:flutter_chat_app/api/api_service.dart';
import 'package:flutter_chat_app/utils/disposable.dart';

import 'chat_repository.dart';

class ChatBloc implements Disposable {
  ChatBloc(this.repository, this.service);

  ChatRepository repository;
  ApiService service;

  @override
  void dispose() {}
}
