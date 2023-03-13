// To parse this JSON data, do
//
//     final CategoryEntity = CategoryEntityFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/category_entity.dart';

CategoryModel categoryEntityFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.message,
    required super.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        message: json["message"],
        data: List<CategoryDataEntity>.from(
            json["data"].map((x) => CategoryDataModel.fromJson(x))),
      );
}

class CategoryDataModel extends CategoryDataEntity {
  CategoryDataModel({
    required super.id,
    required super.categoryName,
    required super.parentId,
    required super.categoryImage,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
    required super.deletedAt,
    required super.deletedBy,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(
        id: json["id"],
        categoryName: json["category_name"],
        parentId: json["parent_id"],
        categoryImage: json["category_image"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "parent_id": parentId,
        "category_image": categoryImage,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt.toIso8601String(),
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
      };
}
