import 'package:core/core.dart';

class ProductCardEntity extends Equatable {
  ProductCardEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final List<ProductCardDataEntity> data;

  @override
  // TODO: implement props
  List<Object?> get props => [message, data];
}

class ProductCardDataEntity extends Equatable {
  ProductCardDataEntity({
    required this.id,
    required this.prodNumber,
    this.prodBarcodeNumber,
    this.prodUniversalNumber,
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
    this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    this.deletedAt,
    this.deletedBy,
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
  final dynamic createdBy;
  final DateTime updatedAt;
  final int updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;

  @override
  // TODO: implement props
  List<Object?> get props => [prodNumber, prodGram];
}
