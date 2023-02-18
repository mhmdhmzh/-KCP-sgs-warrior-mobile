// To parse this JSON data, do
//
//     final LoginRespModel = LoginRespModelFromJson(jsonString);

import 'dart:convert';

import 'package:auth/features/login/domain/entities/login_resp_entity.dart';

LoginRespModel loginRespModelFromJson(String str) =>
    LoginRespModel.fromJson(json.decode(str));

class LoginRespModel extends LoginRespEntity {
  LoginRespModel({
    required super.message,
    required super.data,
  });

  factory LoginRespModel.fromJson(Map<String, dynamic> json) => LoginRespModel(
        message: json["message"],
        data: LoginDataModel.fromJson(json["data"]),
      );
}

class LoginDataModel extends LoginDataEntity {
  LoginDataModel({
    required super.email,
    required super.name,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        email: json["email"],
        name: json["name"],
      );
}
