import 'package:flutter/material.dart';
import 'package:flutter_chat_app/RoundedButton.dart';

class AuthScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
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
                onPressed: navigateToLoginScreen()),
            RoundedButton(
                title: 'Register',
                color: Colors.redAccent,
                onPressed: navigateToRegisterScreen())
          ],
        ),
      ),
    );
  }

  navigateToLoginScreen() {}

  navigateToRegisterScreen() {}
}
