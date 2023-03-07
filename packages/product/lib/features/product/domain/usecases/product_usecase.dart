import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:product/features/product/domain/repositories/product_repository.dart';

class ProductUsecase extends UseCase<ProductEntity, ProductParams> {
  final ProductRepository repository;

  ProductUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductEntity>> call(ProductParams params) async {
    return await repository.getProducts();
  }
}

class SearchProductUsecase extends UseCase<ProductEntity, SearchProductParams> {
  final ProductRepository repository;

  SearchProductUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductEntity>> call(
      SearchProductParams params) async {
    return await repository.searchProducts(params: params);
  }
}

class ProductParams {}

class SearchProductParams {
  final String warehouseId;
  final String prodName;

  SearchProductParams({required this.prodName, required this.warehouseId});
}
