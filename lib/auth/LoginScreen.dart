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
      resizeToAvoidBottomPadding: false,
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
              color: Colors.blueAccent,
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
              color: Colors.blueAccent,
              isObscured: true,
            ),
            RoundedButton(
                title: 'Login',
                color: Colors.blueAccent,
                onPressed: () => _loginUser(email, password)),
          ],
        ),
      ),
    );
  }

  _loginUser(String email, String password) {
    print(email + password);
  }
}
