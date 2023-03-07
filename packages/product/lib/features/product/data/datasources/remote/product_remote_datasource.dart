import 'package:core/core.dart';
import 'package:product/features/product/data/models/product_model.dart';

import '../../../domain/usecases/product_usecase.dart';

abstract class ProductRemoteDatasource {
  Future<ProductModel> getProducts();
  Future<ProductModel> searchProducts({required SearchProductParams params});
}

class ProductRemoteDatasourceImpl extends ProductRemoteDatasource {
  final ApiProvider provider;

  ProductRemoteDatasourceImpl({required this.provider});

  @override
  Future<ProductModel> getProducts() async {
    Map<String, dynamic> data = {
      'warehouse_id': 1,
      'prod_type_id': 1,
    };
    final response = await provider.post(
      'product/search',
      data: data,
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = ProductModel.fromJson(response.data);

      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> searchProducts(
      {required SearchProductParams params}) async {
    Map<String, dynamic> data = {
      'warehouse_id': params.warehouseId,
      'prod_type_id': 1,
      'prod_name': params.prodName,
    };
    final response = await provider.post(
      'product/search',
      data: data,
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = ProductModel.fromJson(response.data);

      return result;
    } else {
      throw ServerException();
    }
  }
}
