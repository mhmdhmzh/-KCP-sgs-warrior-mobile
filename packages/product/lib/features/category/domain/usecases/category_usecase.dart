import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:product/features/category/domain/entities/category_entity.dart';
import 'package:product/features/category/domain/repositories/category_repository.dart';

class CategoryUsecase extends UseCase<CategoryEntity, CategoryParams> {
  final CategoryRepository repository;

  CategoryUsecase({required this.repository});

  @override
  Future<Either<Failure, CategoryEntity>> call(CategoryParams params) async {
    return await repository.getCategory();
  }
}

class CategoryParams {}
