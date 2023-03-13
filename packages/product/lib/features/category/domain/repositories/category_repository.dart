import 'package:core/core.dart';
import 'package:product/features/category/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryEntity>> getCategory();
}
