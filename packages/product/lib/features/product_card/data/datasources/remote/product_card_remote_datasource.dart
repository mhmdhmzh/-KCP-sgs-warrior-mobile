import 'package:core/core.dart';
import 'package:product/features/product/data/models/product_model.dart';
import 'package:product/features/product_card/data/models/product_card_model.dart';

import '../../../domain/usecases/product_card_usecase.dart';

abstract class ProductCardRemoteDatasource {
  Future<ProductCardModel> getProductCard({required ProductCardParams params});
}

class ProductCardRemoteDatasourceImpl extends ProductCardRemoteDatasource {
  final ApiProvider provider;

  ProductCardRemoteDatasourceImpl({required this.provider});

  @override
  Future<ProductCardModel> getProductCard(
      {required ProductCardParams params}) async {
    final response = await provider.get(
      'product/${params.productId}',
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = ProductCardModel.fromJson(response.data);

      return result;
    } else {
      throw ServerException();
    }
  }
}
