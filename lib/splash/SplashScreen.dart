import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/AuthScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ChatApp!',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }

  startTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, _navigateToTheAuthScreen);
  }

  _navigateToTheAuthScreen() {
    Navigator.of(context).pushReplacementNamed(AuthScreen.id);
  }
}
