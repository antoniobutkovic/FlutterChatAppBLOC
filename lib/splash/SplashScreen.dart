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
    return Center(
      child: Text('ChatApp!'),
    );
  }

  startTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigateToTheAuthScreen);
  }

  void navigateToTheAuthScreen() {
    Navigator.of(context).pushReplacementNamed(AuthScreen.id);
  }
}
