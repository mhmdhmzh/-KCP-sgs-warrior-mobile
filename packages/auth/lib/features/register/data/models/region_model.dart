import 'dart:convert';

import 'package:auth/features/register/domain/entities/region_entity.dart';

// To parse this JSON data, do
//
//     final ProvinceModel = ProvinceModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final ProvinceModel = ProvinceModelFromJson(jsonString);

import 'dart:convert';

class RegionModel extends RegionEntity {
  RegionModel({
    required super.province,
    required super.place,
  });

  factory RegionModel.create(
          {required ProvinceModel provinceModel,
          required PlaceModel placeModel}) =>
      RegionModel(
        province: provinceModel,
        place: placeModel,
      );
}

// To parse this JSON data, do
//
//     final ProvinceModel = ProvinceModelFromJson(jsonString);

ProvinceModel provinceModelFromJson(String str) =>
    ProvinceModel.fromJson(json.decode(str));

class ProvinceModel extends ProvinceEntity {
  ProvinceModel({
    required super.message,
    required super.data,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        message: json["message"],
        data: List<ProvinceDataModel>.from(
            json["data"].map((x) => ProvinceDataModel.fromJson(x))),
      );
}

class ProvinceDataModel extends ProvinceDataEntity {
  ProvinceDataModel({
    required super.provinceId,
    required super.province,
  });

  factory ProvinceDataModel.fromJson(Map<String, dynamic> json) =>
      ProvinceDataModel(
        provinceId: json["province_id"],
        province: json["province"],
      );
}

PlaceModel placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

class PlaceModel extends PlaceEntity {
  PlaceModel({
    required super.data,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        data: List<PlaceDataModel>.from(
            json["data"].map((x) => PlaceDataModel.fromJson(x))),
      );
}

class PlaceDataModel extends PlaceDataEntity {
  PlaceDataModel({
    required super.cityId,
    required super.provinceId,
    required super.province,
    required super.type,
    required super.cityName,
    required super.postalCode,
    required super.warehouseId,
    required super.createdAt,
    required super.updatedAt,
    super.deletedAt,
  });

  factory PlaceDataModel.fromJson(Map<String, dynamic> json) => PlaceDataModel(
        cityId: json["city_id"],
        provinceId: json["province_id"],
        province: json["province"],
        type: json["type"],
        cityName: json["city_name"],
        postalCode: json["postal_code"],
        warehouseId: json["warehouse_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );
}
