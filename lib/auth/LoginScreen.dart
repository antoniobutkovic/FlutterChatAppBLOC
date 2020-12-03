import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/AuthRepository.dart';
import 'package:flutter_chat_app/auth/AuthService.dart';
import 'package:flutter_chat_app/auth/AuthBloc.dart';
import 'package:flutter_chat_app/widgets/RoundedButton.dart';
import 'package:flutter_chat_app/widgets/RoundedInputField.dart';
import 'package:provider/provider.dart';

class LoginScreenDI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<AuthRepository, AuthService, AuthBloc>(
      update: (dynamic context, AuthRepository repository, AuthService service,
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
    print("ui $email and $password");
    _authBloc.login(email, password);
  }
}
