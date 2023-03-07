import 'package:core/network/failures.dart';

import 'package:dartz/dartz.dart';

import '../entities/product_card_entity.dart';
import '../usecases/product_card_usecase.dart';

abstract class ProductCardRepository {
  Future<Either<Failure, ProductCardEntity>> getProductCard(
      {required ProductCardParams params});
}
