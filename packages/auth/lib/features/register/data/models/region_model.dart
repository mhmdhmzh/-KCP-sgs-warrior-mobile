import 'dart:convert';

import 'package:auth/features/register/domain/entities/region_entity.dart';

import 'dart:convert';

class RegionModel extends RegionEntity {
  RegionModel(
      {required super.province,
      required super.place,
      required super.subdistrict});

  factory RegionModel.fromJson({
    required Map<String, dynamic> jsonProvince,
    required Map<String, dynamic> jsonPlace,
    required Map<String, dynamic> jsonSubdistrict,
  }) =>
      RegionModel(
          province: ProvinceModel.fromJson(jsonProvince),
          place: PlaceModel.fromJson(jsonPlace),
          subdistrict: SubdistrictModel.fromJson(jsonSubdistrict));
}

ProvinceModel provinceModelFromJson(String str) =>
    ProvinceModel.fromJson(json.decode(str));

class ProvinceModel extends ProvinceEntity {
  ProvinceModel({
    required super.provinceMessage,
    required super.provinceData,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        provinceMessage: json["message"],
        provinceData: List<ProvinceDataModel>.from(
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
    required super.placeMessage,
    required super.placeData,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
        placeMessage: json["message"],
        placeData: List<PlaceDataModel>.from(
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

SubdistrictModel subdistrictModelFromJson(String str) =>
    SubdistrictModel.fromJson(json.decode(str));

class SubdistrictModel extends SubdistrictEntity {
  SubdistrictModel({
    required super.subdistrictMessage,
    required super.subdistrictData,
  });

  factory SubdistrictModel.fromJson(Map<String, dynamic> json) =>
      SubdistrictModel(
        subdistrictMessage: json["message"],
        subdistrictData: List<SubdistrictDataModel>.from(
            json["data"].map((x) => SubdistrictDataModel.fromJson(x))),
      );
}

class SubdistrictDataModel extends SubdistrictDataEntity {
  SubdistrictDataModel({
    required super.subdistrictId,
    required super.provinceId,
    required super.province,
    required super.cityId,
    required super.city,
    required super.type,
    required super.subdistrictName,
  });

  factory SubdistrictDataModel.fromJson(Map<String, dynamic> json) =>
      SubdistrictDataModel(
        subdistrictId: json["subdistrict_id"],
        provinceId: json["province_id"],
        province: json["province"],
        cityId: json["city_id"],
        city: json["city"],
        type: json["type"],
        subdistrictName: json["subdistrict_name"],
      );
}
