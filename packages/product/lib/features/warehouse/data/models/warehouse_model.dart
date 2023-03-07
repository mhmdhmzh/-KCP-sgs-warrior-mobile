// To parse this JSON data, do
//
//     final WarehouseModel = WarehouseModelFromJson(jsonString);

import 'dart:convert';

import 'package:product/features/warehouse/domain/entities/warehouse_entity.dart';

WarehouseModel warehouseModelFromJson(String str) =>
    WarehouseModel.fromJson(json.decode(str));

class WarehouseModel extends WarehouseEntity {
  WarehouseModel({
    required super.message,
    required super.data,
  });

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => WarehouseModel(
        message: json["message"],
        data: List<WarehouseDataModel>.from(
            json["data"].map((x) => WarehouseDataModel.fromJson(x))),
      );
}

class WarehouseDataModel extends WarehouseDataEntity {
  WarehouseDataModel({
    required super.id,
    required super.short,
    required super.name,
    required super.code,
  });

  factory WarehouseDataModel.fromJson(Map<String, dynamic> json) =>
      WarehouseDataModel(
        id: json["id"],
        short: json["short"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "short": short,
        "name": name,
        "code": code,
      };
}
