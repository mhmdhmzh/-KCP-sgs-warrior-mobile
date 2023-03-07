import 'package:core/core.dart';
import 'package:product/features/product_card/data/datasources/remote/product_card_remote_datasource.dart';
import 'package:product/features/product_card/domain/entities/product_card_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:core/network/failures.dart';
import 'package:product/features/product_card/domain/repositories/product_card_repository.dart';
import 'package:product/features/product_card/domain/usecases/product_card_usecase.dart';

class ProductCardRepositoryImpl extends ProductCardRepository {
  final ProductCardRemoteDatasource datasource;

  ProductCardRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, ProductCardEntity>> getProductCard(
      {required ProductCardParams params}) async {
    try {
      final response = await datasource.getProductCard(params: params);
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
