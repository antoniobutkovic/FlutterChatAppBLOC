import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/RoundedButton.dart';
import 'package:flutter_chat_app/widgets/RoundedInputField.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInputField(
              hint: 'Enter email',
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedInputField(
              hint: 'Enter password',
              onChanged: (value) {
                password = value;
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            RoundedButton(
                title: 'Login',
                color: Colors.blueAccent,
                onPressed: () => loginUser(email, password)),
          ],
        ),
      ),
    );
  }

  loginUser(String email, String password) {
    print(email + password);
  }
}
