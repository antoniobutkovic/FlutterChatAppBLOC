import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_app/widgets/message_bubble.dart';
import 'package:provider/provider.dart';

import 'chat_bloc.dart';
import 'chat_repository.dart';

class ChatScreenDI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider<ChatRepository, ChatBloc>(
      update: (dynamic context, ChatRepository repository, ChatBloc previous) =>
          previous ?? ChatBloc(repository),
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
  String _messageText;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _chatBloc = Provider.of(context, listen: false);
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
        title: Text('ChatApp'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _chatBloc.getMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final messages = snapshot.data.docs;
                List<MessageBubble> messageBubbles = [];
                for (var message in messages) {
                  messageBubbles.add(_chatBloc.mapData(message));
                }
                messageBubbles.sort((a, b) => b.time.compareTo(a.time));
                return Expanded(
                  child: ListView(
                    reverse: true,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: messageBubbles,
                  ),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        _messageText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _textEditingController.clear();
                      _chatBloc.sendMessage(_messageText, '');
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
