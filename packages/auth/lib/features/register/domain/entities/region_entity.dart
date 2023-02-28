import 'package:core/core.dart';
import 'dart:convert';

class RegionEntity extends Equatable {
  RegionEntity({required this.province, required this.place});

  final ProvinceEntity province;
  final PlaceEntity place;

  @override
  List<Object?> get props => [province, place];
}

class ProvinceEntity extends Equatable {
  ProvinceEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final List<ProvinceDataEntity> data;

  @override
  List<Object?> get props => [message, data];
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
    required this.data,
  });

  final List<PlaceDataEntity> data;

  @override
  List<Object?> get props => [data];
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
