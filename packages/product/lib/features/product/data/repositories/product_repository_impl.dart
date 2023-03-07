import 'package:core/core.dart';
import 'package:product/features/product/data/datasources/remote/product_remote_datasource.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:core/network/failures.dart';
import 'package:product/features/product/domain/repositories/product_repository.dart';
import 'package:product/features/product/domain/usecases/product_usecase.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDatasource datasource;

  ProductRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, ProductEntity>> getProducts() async {
    try {
      final response = await datasource.getProducts();
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> searchProducts(
      {required SearchProductParams params}) async {
    try {
      final response = await datasource.searchProducts(params: params);
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
