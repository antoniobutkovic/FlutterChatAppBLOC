import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/RoundedButton.dart';

import 'LoginScreen.dart';
import 'RegistrationScreen.dart';

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
                onPressed: () =>
                    _navigateToLoginScreen(LoginScreen.id, context)),
            RoundedButton(
                title: 'Register',
                color: Colors.redAccent,
                onPressed: () =>
                    _navigateToRegisterScreen(RegistrationScreen.id, context))
          ],
        ),
      ),
    );
  }

  _navigateToLoginScreen(route, context) {
    Navigator.of(context).pushNamed(route);
  }

  _navigateToRegisterScreen(route, context) {
    Navigator.of(context).pushNamed(route);
  }
}
