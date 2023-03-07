import 'package:core/core.dart';
import 'package:product/features/warehouse/domain/entities/warehouse_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WarehouseRepository {
  Future<Either<Failure, WarehouseEntity>> getWarehouse();
}
