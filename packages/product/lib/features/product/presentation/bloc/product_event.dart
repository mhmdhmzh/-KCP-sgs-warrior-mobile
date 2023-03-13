part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProduct extends ProductEvent {}

class GetTopProduct extends ProductEvent {}

class SearchProduct extends ProductEvent {
  final String prodName;
  final String warehouseId;

  SearchProduct({required this.prodName, required this.warehouseId});
}

class GetProductCard extends ProductEvent {
  final String prodName;
  final String warehouseId;

  GetProductCard({required this.prodName, required this.warehouseId});
}
