import 'package:core/core.dart';
import 'package:product/features/warehouse/data/models/warehouse_model.dart';

abstract class WarehouseRemoteDatasource {
  Future<WarehouseModel> getWarehouse();
}

class WarehouseRemoteDatasourceImpl extends WarehouseRemoteDatasource {
  final ApiProvider provider;
  WarehouseRemoteDatasourceImpl({required this.provider});

  @override
  Future<WarehouseModel> getWarehouse() async {
    final response = await provider.get(
      'warehouse',
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = WarehouseModel.fromJson(response.data);
      return result;
    } else {
      throw ServerException();
    }
  }
}
