import 'package:core/core.dart';

class TopProductEntity extends Equatable {
  TopProductEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<TopProductDataEntity> data;

  @override
  List<Object?> get props => [status, message];
}

class TopProductDataEntity extends Equatable {
  TopProductDataEntity({
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
    this.updatedAt,
    this.updatedBy,
    this.deletedAt,
    this.deletedBy,
    this.image,
    required this.totalOrder,
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
  final String? image;
  final String totalOrder;

  @override
  List<Object?> get props => [id, prodNumber];
}
