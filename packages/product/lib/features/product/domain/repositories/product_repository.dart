import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:product/features/product/domain/usecases/product_usecase.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductEntity>> getProducts();
  Future<Either<Failure, ProductEntity>> searchProducts(
      {required SearchProductParams params});
}
