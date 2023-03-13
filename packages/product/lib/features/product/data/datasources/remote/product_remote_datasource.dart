import 'package:core/core.dart';
import 'package:product/features/product/data/models/product_model.dart';
import 'package:product/features/product/data/models/top_product_model.dart';

import '../../../domain/usecases/product_usecase.dart';

import 'package:core/common/constants.dart' as constants;

abstract class ProductRemoteDatasource {
  Future<ProductModel> getProducts();
  Future<TopProductModel> getTopProducts();
  Future<ProductModel> searchProducts({required SearchProductParams params});
  Future<ProductModel> getProductCard({required SearchProductParams params});
}

class ProductRemoteDatasourceImpl extends ProductRemoteDatasource {
  final ApiProvider provider;

  ProductRemoteDatasourceImpl({required this.provider});

  @override
  Future<ProductModel> getProducts() async {
    Map<String, dynamic> data = {
      'warehouse_id':
          sl<SharedPreferences>().getString(constants.PREF_KEY_WAREHOUSE_ID),
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

  @override
  Future<TopProductModel> getTopProducts() async {
    Map<String, dynamic> data = {
      'email': sl<SharedPreferences>().getString(constants.PREF_KEY_EMAIL),
      'token': sl<SharedPreferences>().getString(constants.PREF_KEY_TOKEN),
    };
    final response = await provider.post(
      'top-product/get',
      data: data,
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = TopProductModel.fromJson(response.data);
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProductCard(
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
