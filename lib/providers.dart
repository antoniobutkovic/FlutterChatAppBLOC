import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/api/api_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'auth/auth_bloc.dart';
import 'auth/auth_repository.dart';
import 'chat/chat_bloc.dart';
import 'chat/chat_repository.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ..._independentServices,
  ..._dependentServices
];

List<SingleChildWidget> _independentServices = <SingleChildWidget>[
  Provider<ApiService>.value(
      value: ApiService(FirebaseAuth.instance, FirebaseFirestore.instance)),
];

List<SingleChildWidget> _dependentServices = <SingleChildWidget>[
  ProxyProvider<ApiService, AuthRepositoryImpl>(
      update: (
    BuildContext context,
    ApiService service,
    AuthRepository previous,
  ) =>
          previous ?? AuthRepositoryImpl(service)),
  ProxyProvider<AuthRepositoryImpl, AuthBloc>(
    update: (
      BuildContext context,
      AuthRepository repository,
      AuthBloc previous,
    ) =>
        previous ?? AuthBloc(repository),
  ),
  ProxyProvider<ApiService, ChatRepositoryImpl>(
      update: (
    BuildContext context,
    ApiService service,
    ChatRepository previous,
  ) =>
          previous ?? ChatRepositoryImpl(service)),
  ProxyProvider<ChatRepositoryImpl, ChatBloc>(
    update: (
      BuildContext context,
      ChatRepository repository,
      ChatBloc previous,
    ) =>
        previous ?? ChatBloc(repository),
  ),
];
