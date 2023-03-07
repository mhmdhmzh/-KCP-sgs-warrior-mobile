import 'package:core/core.dart';

class WarehouseEntity extends Equatable {
  WarehouseEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final List<WarehouseDataEntity> data;

  @override
  List<Object?> get props => [message, data];
}

class WarehouseDataEntity extends Equatable {
  WarehouseDataEntity({
    required this.id,
    required this.short,
    required this.name,
    required this.code,
  });

  final int id;
  final String short;
  final String name;
  final String code;

  @override
  List<Object?> get props => [id, short];
}
