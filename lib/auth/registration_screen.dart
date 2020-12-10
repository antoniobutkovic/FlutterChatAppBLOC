import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/auth_bloc.dart';
import 'package:flutter_chat_app/chat/chat_screen.dart';
import 'package:flutter_chat_app/utils/api_response.dart';
import 'package:flutter_chat_app/widgets/rounded_button.dart';
import 'package:flutter_chat_app/widgets/rounded_input_field.dart';
import 'package:provider/provider.dart';

import 'auth_repository.dart';

class RegisterScreenDI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProxyProvider<AuthRepository, AuthBloc>(
      update: (dynamic context, AuthRepository repository, AuthBloc previous) =>
          previous ?? AuthBloc(repository),
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
  String _email;
  String _password;
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
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RoundedInputField(
                  hint: 'Enter email',
                  onChanged: (value) {
                    _email = value;
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
                    _password = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  color: Colors.redAccent,
                  isObscured: true,
                ),
                StreamBuilder<ApiResponse<UserCredential>>(
                    stream: _authBloc.user,
                    builder: (context,
                        AsyncSnapshot<ApiResponse<UserCredential>> snapshot) {
                      if (snapshot.hasData) {
                        switch (snapshot.data.status) {
                          case Status.LOADING:
                            return Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(
                                  child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.redAccent),
                              )),
                            );
                          case Status.COMPLETED:
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  ChatScreen.id,
                                  (Route<dynamic> route) => false);
                            });
                            break;
                          case Status.ERROR:
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              showErrorDialog(snapshot.data.message);
                            });
                            break;
                        }
                      }
                      return RoundedButton(
                          title: 'Register',
                          color: Colors.redAccent,
                          onPressed: () =>
                              _authBloc.register(_email, _password));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showErrorDialog(String text) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Error'),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
