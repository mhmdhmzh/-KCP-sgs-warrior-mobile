// To parse this JSON data, do
//
//     final ProductCardModel = ProductCardModelFromJson(jsonString);

import 'dart:convert';

import 'package:product/features/product_card/domain/entities/product_card_entity.dart';

ProductCardModel productCardModelFromJson(String str) =>
    ProductCardModel.fromJson(json.decode(str));

class ProductCardModel extends ProductCardEntity {
  ProductCardModel({
    required super.message,
    required super.data,
  });

  factory ProductCardModel.fromJson(Map<String, dynamic> json) =>
      ProductCardModel(
        message: json["message"],
        data: List<ProductCardDataModel>.from(
            json["data"].map((x) => ProductCardDataModel.fromJson(x))),
      );
}

class ProductCardDataModel extends ProductCardDataEntity {
  ProductCardDataModel({
    required super.id,
    required super.prodNumber,
    required super.prodBarcodeNumber,
    required super.prodUniversalNumber,
    required super.prodName,
    required super.prodModalPrice,
    required super.prodBasePrice,
    required super.prodGram,
    required super.prodSatuan,
    required super.prodRegulerId,
    required super.principleId,
    required super.categoryId,
    required super.subCategoryId,
    required super.prodDescription,
    required super.prodTypeId,
    required super.prodStatusId,
    required super.brandId,
    required super.minPoin,
    required super.diskon,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
    required super.deletedAt,
    required super.deletedBy,
  });

  factory ProductCardDataModel.fromJson(Map<String, dynamic> json) =>
      ProductCardDataModel(
        id: json["id"],
        prodNumber: json["prod_number"],
        prodBarcodeNumber: json["prod_barcode_number"],
        prodUniversalNumber: json["prod_universal_number"],
        prodName: json["prod_name"],
        prodModalPrice: json["prod_modal_price"],
        prodBasePrice: json["prod_base_price"],
        prodGram: json["prod_gram"],
        prodSatuan: json["prod_satuan"],
        prodRegulerId: json["prod_reguler_id"],
        principleId: json["principle_id"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        prodDescription: json["prod_description"],
        prodTypeId: json["prod_type_id"],
        prodStatusId: json["prod_status_id"],
        brandId: json["brand_id"],
        minPoin: json["min_poin"],
        diskon: json["diskon"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
      );
}
