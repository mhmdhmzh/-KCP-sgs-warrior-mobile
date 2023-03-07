import 'package:core/core.dart';

import '../entities/product_card_entity.dart';
import '../repositories/product_card_repository.dart';
import 'package:dartz/dartz.dart';

class ProductCardUsecase extends UseCase<ProductCardEntity, ProductCardParams> {
  final ProductCardRepository repository;

  ProductCardUsecase({required this.repository});

  @override
  Future<Either<Failure, ProductCardEntity>> call(
      ProductCardParams params) async {
    return await repository.getProductCard(params: params);
  }
}

class ProductCardParams {
  final String productId;

  ProductCardParams({required this.productId});
}
