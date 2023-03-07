// To parse this JSON data, do
//
//     final ProductModel = ProductModelFromJson(jsonString);

import 'dart:convert';

import 'package:product/features/product/domain/entities/product_entity.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

class ProductModel extends ProductEntity {
  ProductModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        message: json["message"],
        data: List<ProductDataModel>.from(
            json["data"].map((x) => ProductDataModel.fromJson(x))),
      );
}

class ProductDataModel extends ProductDataEntity {
  ProductDataModel({
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
    required super.principleCode,
    required super.principleName,
    required super.brandCode,
    required super.brandName,
    required super.subCategoryName,
    required super.categoryName,
    required super.productType,
    required super.statusName,
    required super.prodImage,
    required super.warehouseId,
    required super.warehouseName,
    required super.prodWarpay,
    required super.stock,
    required super.image,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
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
        principleCode: json["principle_code"],
        principleName: json["principle_name"],
        brandCode: json["brand_code"],
        brandName: json["brand_name"],
        subCategoryName: json["sub_category_name"],
        categoryName: json["category_name"],
        productType: json["product_type"],
        statusName: json["status_name"],
        prodImage: json["prod_image"],
        warehouseId: json["warehouse_id"],
        warehouseName: json["warehouse_name"],
        prodWarpay: json["prod_warpay"],
        stock: json["stock"],
        image: List<String>.from(json["image"].map((x) => x)),
      );
}
