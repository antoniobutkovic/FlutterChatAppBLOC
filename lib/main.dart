import 'package:flutter/material.dart';
import 'package:flutter_chat_app/LoginScreen.dart';
import 'package:flutter_chat_app/RegistrationScreen.dart';

import 'SplashScreen.dart';
import 'AuthScreen.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        AuthScreen.id: (context) => AuthScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen()
      },
    );
  }
}
