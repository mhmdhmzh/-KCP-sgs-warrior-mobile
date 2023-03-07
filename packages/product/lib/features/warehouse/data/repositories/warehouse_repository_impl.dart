import 'package:core/core.dart';
import 'package:product/features/warehouse/data/datasources/remote/warehouse_remote_datasource.dart';
import 'package:product/features/warehouse/domain/entities/warehouse_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:core/network/failures.dart';
import 'package:product/features/warehouse/domain/repositories/warehouse_repository.dart';

class WarehouseRepositoryImpl extends WarehouseRepository {
  final WarehouseRemoteDatasource datasource;

  WarehouseRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, WarehouseEntity>> getWarehouse() async {
    try {
      final response = await datasource.getWarehouse();
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
