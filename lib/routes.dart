import 'package:flutter/widgets.dart';
import 'package:flutter_chat_app/chat/chat_screen.dart';

import 'auth/auth_screen.dart';
import 'auth/login_screen.dart';
import 'auth/registration_screen.dart';
import 'splash/splash_screen.dart';
import 'chat/chat_screen.dart';

final Map<String, WidgetBuilder> routes = {
  AuthScreen.id: (context) => AuthScreen(),
  SplashScreen.id: (context) => SplashScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen(),
  ChatScreen.id: (context) => ChatScreen()
};
