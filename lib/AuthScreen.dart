import 'package:flutter/material.dart';
import 'package:flutter_chat_app/RoundedButton.dart';

import 'LoginScreen.dart';
import 'RegistrationScreen.dart';

class AuthScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
                title: 'Login',
                color: Colors.blueAccent,
                onPressed: () => navigateToLoginScreen(LoginScreen.id)),
            RoundedButton(
                title: 'Register',
                color: Colors.redAccent,
                onPressed: () =>
                    navigateToRegisterScreen(RegistrationScreen.id))
          ],
        ),
      ),
    );
  }

  navigateToLoginScreen(route) {
    Navigator.of(context).pushNamed(route);
  }

  navigateToRegisterScreen(route) {
    Navigator.of(context).pushNamed(route);
  }
}
