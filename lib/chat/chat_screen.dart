import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// class ChatScreenDI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ProxyProvider2<AuthRepository, ApiService, AuthBloc>(
//       update: (dynamic context, AuthRepository repository, ApiService service,
//               AuthBloc previous) =>
//           previous ?? AuthBloc(repository, service),
//       dispose: (dynamic context, AuthBloc bloc) => bloc.dispose(),
//       child: RegistrationScreen(),
//     );
//   }
// }

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
