import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/features/warehouse/domain/entities/warehouse_entity.dart';
import 'package:product/features/warehouse/domain/repositories/warehouse_repository.dart';

class WarehouseUsecase extends UseCase<WarehouseEntity, WarehouseParams> {
  final WarehouseRepository repository;
  WarehouseUsecase({required this.repository});

  @override
  Future<Either<Failure, WarehouseEntity>> call(WarehouseParams params) async {
    return await repository.getWarehouse();
  }
}

class WarehouseParams {}
