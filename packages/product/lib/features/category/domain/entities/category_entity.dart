import 'package:core/core.dart';

class CategoryEntity extends Equatable {
  CategoryEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final List<CategoryDataEntity> data;

  @override
  List<Object?> get props => [message, data];
}

class CategoryDataEntity extends Equatable {
  CategoryDataEntity({
    required this.id,
    required this.categoryName,
    required this.parentId,
    this.categoryImage,
    required this.createdAt,
    this.createdBy,
    required this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.deletedBy,
  });

  final int id;
  final String categoryName;
  final int parentId;
  final String? categoryImage;
  final DateTime createdAt;
  final dynamic createdBy;
  final DateTime updatedAt;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;

  @override
  List<Object?> get props => [id, categoryName];
}
