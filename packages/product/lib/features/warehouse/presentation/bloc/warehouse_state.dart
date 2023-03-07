part of 'warehouse_bloc.dart';

@immutable
abstract class WarehouseState {}

class WarehouseInitial extends WarehouseState {}

class Loading extends WarehouseState {}

class Success extends WarehouseState {
  final WarehouseEntity warehouseEntity;

  Success({required this.warehouseEntity});
}

class Error extends WarehouseState {
  final String message;

  Error({required this.message});
}

class Empty extends WarehouseState {}
