import 'package:flutter/widgets.dart';

import 'auth/AuthScreen.dart';
import 'auth/LoginScreen.dart';
import 'auth/RegistrationScreen.dart';
import 'splash/SplashScreen.dart';

final Map<String, WidgetBuilder> routes = {
  AuthScreen.id: (context) => AuthScreen(),
  SplashScreen.id: (context) => SplashScreen(),
  LoginScreen.id: (context) => LoginScreen(),
  RegistrationScreen.id: (context) => RegistrationScreen()
};
