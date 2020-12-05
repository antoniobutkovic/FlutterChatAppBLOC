import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/auth_repository.dart';
import 'package:flutter_chat_app/auth/api_service.dart';
import 'package:flutter_chat_app/auth/auth_bloc.dart';
import 'package:flutter_chat_app/widgets/rounded_button.dart';
import 'package:flutter_chat_app/widgets/rounded_input_field.dart';
import 'package:provider/provider.dart';

class LoginScreenDI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<AuthRepository, ApiService, AuthBloc>(
      update: (dynamic context, AuthRepository repository, ApiService service,
              AuthBloc previous) =>
          previous ?? AuthBloc(repository, service),
      dispose: (dynamic context, AuthBloc bloc) => bloc.dispose(),
      child: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            StreamBuilder<UserCredential>(
                stream: _authBloc.user,
                builder: (context, AsyncSnapshot<UserCredential> snapshot) {
                  if (snapshot.hasData) {
                    print("navigate next");
                  }
                  return RoundedButton(
                      title: 'Login',
                      color: Colors.blueAccent,
                      onPressed: () => _authBloc.login(email, password));
                }),
          ],
        ),
      ),
    );
  }
}
