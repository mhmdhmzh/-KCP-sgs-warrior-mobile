import 'package:core/core.dart';

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class LoginRespEntity extends Equatable {
  LoginRespEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final LoginDataEntity data;

  @override
  List<Object?> get props => [message, data];
}

class LoginDataEntity extends Equatable {
  LoginDataEntity({
    required this.email,
    required this.name,
  });

  final String email;
  final String name;

  @override
  List<Object?> get props => [email, name];
}
