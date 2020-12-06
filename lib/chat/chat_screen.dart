import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_app/api/api_service.dart';
import 'package:provider/provider.dart';

import 'chat_bloc.dart';
import 'chat_repository.dart';

class ChatScreenDI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<ChatRepository, ApiService, ChatBloc>(
      update: (dynamic context, ChatRepository repository, ApiService service,
              ChatBloc previous) =>
          previous ?? ChatBloc(repository, service),
      dispose: (dynamic context, ChatBloc bloc) => bloc.dispose(),
      child: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _chatBloc = Provider.of(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
