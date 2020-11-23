import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              child: Text('Test button 1'),
              color: Colors.blueAccent,
            ),
            MaterialButton(
              child: Text('Test button 1'),
              color: Colors.blueAccent,
            ),
            MaterialButton(
              child: Text('Test button 2'),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
