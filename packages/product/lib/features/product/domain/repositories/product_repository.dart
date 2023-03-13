import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:product/features/product/domain/entities/top_product_entity.dart';
import 'package:product/features/product/domain/usecases/product_usecase.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductEntity>> getProducts();
  Future<Either<Failure, TopProductEntity>> getTopProducts();
  Future<Either<Failure, ProductEntity>> searchProducts(
      {required SearchProductParams params});
  Future<Either<Failure, ProductEntity>> getProductCard(
      {required SearchProductParams params});
}
