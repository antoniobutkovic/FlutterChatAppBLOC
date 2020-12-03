import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/auth_bloc.dart';
import 'package:flutter_chat_app/widgets/rounded_button.dart';
import 'package:flutter_chat_app/widgets/rounded_input_field.dart';
import 'package:provider/provider.dart';

import 'api_service.dart';
import 'auth_repository.dart';

class RegisterScreenDI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<AuthRepository, ApiService, AuthBloc>(
      update: (dynamic context, AuthRepository repository, ApiService service,
              AuthBloc previous) =>
          previous ?? AuthBloc(repository, service),
      dispose: (dynamic context, AuthBloc bloc) => bloc.dispose(),
      child: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = Provider.of(context, listen: false);
  }

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
    _authBloc.register(email, password);
  }
}
