// To parse this JSON data, do
//
//     final TopProductModel = TopProductModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/top_product_entity.dart';

TopProductModel topProductModelFromJson(String str) =>
    TopProductModel.fromJson(json.decode(str));

class TopProductModel extends TopProductEntity {
  TopProductModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory TopProductModel.fromJson(Map<String, dynamic> json) =>
      TopProductModel(
        status: json["status"],
        message: json["message"],
        data: List<TopProductDataModel>.from(
            json["data"].map((x) => TopProductDataModel.fromJson(x))),
      );
}

class TopProductDataModel extends TopProductDataEntity {
  TopProductDataModel({
    required super.id,
    required super.prodNumber,
    super.prodBarcodeNumber,
    super.prodUniversalNumber,
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
    super.createdBy,
    super.updatedAt,
    super.updatedBy,
    super.deletedAt,
    super.deletedBy,
    super.image,
    required super.totalOrder,
  });

  factory TopProductDataModel.fromJson(Map<String, dynamic> json) =>
      TopProductDataModel(
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
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
        image: json["image"],
        totalOrder: json["total_order"],
      );
}
