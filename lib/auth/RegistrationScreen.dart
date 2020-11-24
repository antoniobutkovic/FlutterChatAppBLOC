import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/RoundedButton.dart';
import 'package:flutter_chat_app/widgets/RoundedInputField.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              color: Colors.redAccent,
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
              color: Colors.redAccent,
              isObscured: true,
            ),
            RoundedButton(
                title: 'Register',
                color: Colors.redAccent,
                onPressed: () => _registerUser(email, password)),
          ],
        ),
      ),
    );
  }

  _registerUser(String email, String password) {
    print(email + password);
  }
}
