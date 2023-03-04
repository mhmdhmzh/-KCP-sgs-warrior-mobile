// To parse this JSON data, do
//
//     final PinRespModel = PinRespModelFromJson(jsonString);

import 'dart:convert';

import 'package:auth/features/pin/domain/entities/pin_entity.dart';

PinRespModel pinRespModelFromJson(String str) =>
    PinRespModel.fromJson(json.decode(str));

class PinRespModel extends PinRespEntity {
  PinRespModel({
    required super.message,
    required super.data,
  });

  factory PinRespModel.fromJson(Map<String, dynamic> json) => PinRespModel(
        message: json["message"],
        data: PinRespDataModel.fromJson(json["data"]),
      );
}

class PinRespDataModel extends PinRespDataEntity {
  PinRespDataModel({
    required super.token,
    required super.email,
    required super.pin,
  });

  factory PinRespDataModel.fromJson(Map<String, dynamic> json) =>
      PinRespDataModel(
        token: json["token"],
        email: json["email"],
        pin: json["pin"],
      );
}
