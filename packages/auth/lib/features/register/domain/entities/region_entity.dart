import 'package:core/core.dart';
import 'dart:convert';

class RegionEntity extends Equatable {
  RegionEntity({
    required this.province,
    required this.place,
    required this.subdistrict,
  });

  final ProvinceEntity province;
  final PlaceEntity place;
  final SubdistrictEntity subdistrict;

  @override
  List<Object?> get props => [province, place];
}

class ProvinceEntity extends Equatable {
  ProvinceEntity({
    required this.provinceMessage,
    required this.provinceData,
  });

  final String provinceMessage;
  final List<ProvinceDataEntity> provinceData;

  @override
  List<Object?> get props => [provinceMessage, provinceData];
}

class ProvinceDataEntity extends Equatable {
  ProvinceDataEntity({
    required this.provinceId,
    required this.province,
  });

  final int provinceId;
  final String province;

  @override
  List<Object?> get props => [provinceId, province];
}

class PlaceEntity extends Equatable {
  PlaceEntity({
    required this.placeMessage,
    required this.placeData,
  });
  final String placeMessage;
  final List<PlaceDataEntity> placeData;

  @override
  List<Object?> get props => [placeMessage, placeData];
}

class PlaceDataEntity extends Equatable {
  PlaceDataEntity({
    required this.cityId,
    required this.provinceId,
    required this.province,
    required this.type,
    required this.cityName,
    required this.postalCode,
    required this.warehouseId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final int cityId;
  final int provinceId;
  final String province;
  final String type;
  final String cityName;
  final int postalCode;
  final int warehouseId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  @override
  List<Object?> get props => [cityId, provinceId, province];
}

class SubdistrictEntity extends Equatable {
  SubdistrictEntity({
    required this.subdistrictMessage,
    required this.subdistrictData,
  });

  final String subdistrictMessage;
  final List<SubdistrictDataEntity> subdistrictData;

  @override
  List<Object?> get props => [subdistrictMessage, subdistrictData];
}

class SubdistrictDataEntity extends Equatable {
  SubdistrictDataEntity({
    required this.subdistrictId,
    required this.provinceId,
    required this.province,
    required this.cityId,
    required this.city,
    required this.type,
    required this.subdistrictName,
  });

  final int subdistrictId;
  final int provinceId;
  final String province;
  final int cityId;
  final String city;
  final String type;
  final String subdistrictName;

  @override
  List<Object?> get props => [city, province];
}
