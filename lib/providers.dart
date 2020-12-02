import 'package:flutter_chat_app/auth/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ..._independentServices,
  // ..._dependentServices
];

List<SingleChildWidget> _independentServices = <SingleChildWidget>[
  Provider<AuthService>.value(value: AuthService()),
];

// List<SingleChildWidget> _dependentServices = <SingleChildWidget>[];
