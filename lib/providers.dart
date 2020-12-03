import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/auth/AuthRepositoryImpl.dart';
import 'package:flutter_chat_app/auth/ApiService.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'auth/AuthBloc.dart';
import 'auth/AuthRepository.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ..._independentServices,
  ..._dependentServices
];

List<SingleChildWidget> _independentServices = <SingleChildWidget>[
  Provider<ApiService>.value(value: ApiService(FirebaseAuth.instance)),
];

List<SingleChildWidget> _dependentServices = <SingleChildWidget>[
  ProxyProvider<ApiService, AuthRepositoryImpl>(
      update: (
    BuildContext context,
    ApiService service,
    AuthRepository previous,
  ) =>
          previous ?? AuthRepositoryImpl(service)),
  ProxyProvider2<ApiService, AuthRepositoryImpl, AuthBloc>(
    update: (
      BuildContext context,
      ApiService service,
      AuthRepository repository,
      AuthBloc previous,
    ) =>
        previous ?? AuthBloc(repository, service),
  )
];
