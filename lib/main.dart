import 'package:flutter/material.dart';
import 'package:flutter_chat_app/providers.dart';
import 'package:flutter_chat_app/routes.dart';
import 'package:provider/provider.dart';
import 'splash/SplashScreen.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        initialRoute: SplashScreen.id,
        routes: routes,
      ),
    );
  }
}
