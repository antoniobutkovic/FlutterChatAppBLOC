import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/AuthRepositoryImpl.dart';
import 'package:flutter_chat_app/auth/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'auth/AuthBloc.dart';
import 'auth/AuthRepository.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ..._independentServices,
  ..._dependentServices
];

List<SingleChildWidget> _independentServices = <SingleChildWidget>[
  Provider<AuthService>.value(value: AuthService()),
];

List<SingleChildWidget> _dependentServices = <SingleChildWidget>[
  ProxyProvider<AuthService, AuthRepositoryImpl>(
      update: (
    BuildContext context,
    AuthService service,
    AuthRepository previous,
  ) =>
          previous ?? AuthRepositoryImpl(service)),
  ProxyProvider2<AuthService, AuthRepositoryImpl, AuthBloc>(
    update: (
      BuildContext context,
      AuthService service,
      AuthRepository repository,
      AuthBloc previous,
    ) =>
        previous ?? AuthBloc(repository, service),
  )
];
