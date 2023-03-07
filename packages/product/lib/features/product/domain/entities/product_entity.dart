import 'package:core/core.dart';

class ProductEntity extends Equatable {
  ProductEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<ProductDataEntity> data;

  @override
  List<Object?> get props => [status, message];
}

class ProductDataEntity {
  ProductDataEntity({
    required this.id,
    required this.prodNumber,
    required this.prodBarcodeNumber,
    required this.prodUniversalNumber,
    required this.prodName,
    required this.prodModalPrice,
    required this.prodBasePrice,
    required this.prodGram,
    required this.prodSatuan,
    required this.prodRegulerId,
    required this.principleId,
    required this.categoryId,
    required this.subCategoryId,
    required this.prodDescription,
    required this.prodTypeId,
    required this.prodStatusId,
    required this.brandId,
    required this.minPoin,
    required this.diskon,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.deletedAt,
    required this.deletedBy,
    required this.principleCode,
    required this.principleName,
    required this.brandCode,
    required this.brandName,
    required this.subCategoryName,
    required this.categoryName,
    required this.productType,
    required this.statusName,
    required this.prodImage,
    required this.warehouseId,
    required this.warehouseName,
    required this.prodWarpay,
    required this.stock,
    required this.image,
  });

  final int id;
  final String prodNumber;
  final dynamic prodBarcodeNumber;
  final dynamic prodUniversalNumber;
  final String prodName;
  final String prodModalPrice;
  final String prodBasePrice;
  final String prodGram;
  final dynamic prodSatuan;
  final int prodRegulerId;
  final int principleId;
  final int categoryId;
  final int subCategoryId;
  final String prodDescription;
  final int prodTypeId;
  final int prodStatusId;
  final int brandId;
  final int minPoin;
  final int diskon;
  final DateTime createdAt;
  final int? createdBy;
  final DateTime? updatedAt;
  final int? updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;
  final String principleCode;
  final String principleName;
  final String brandCode;
  final String brandName;
  final String subCategoryName;
  final String categoryName;
  final String productType;
  final String statusName;
  final String prodImage;
  final int warehouseId;
  final String warehouseName;
  final int prodWarpay;
  final int stock;
  final List<String> image;
}
