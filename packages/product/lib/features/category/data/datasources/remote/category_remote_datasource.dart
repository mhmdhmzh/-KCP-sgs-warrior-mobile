import 'package:core/core.dart';
import 'package:product/features/category/data/models/category_model.dart';

abstract class CategoryRemoteDatasource {
  Future<CategoryModel> getCategory();
}

class CategoryRemoteDatasourceImpl extends CategoryRemoteDatasource {
  final ApiProvider provider;

  CategoryRemoteDatasourceImpl({required this.provider});

  @override
  Future<CategoryModel> getCategory() async {
    final response = await provider.get(
      'category',
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = CategoryModel.fromJson(response.data);
      return result;
    } else {
      throw ServerException();
    }
  }
}
