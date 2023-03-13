import 'package:core/core.dart';
import 'package:product/features/category/data/datasources/remote/category_remote_datasource.dart';
import 'package:product/features/category/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:core/network/failures.dart';
import 'package:product/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDatasource datasource;

  CategoryRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, CategoryEntity>> getCategory() async {
    try {
      final response = await datasource.getCategory();
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
