part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProduct extends ProductEvent {}

class SearchProduct extends ProductEvent {
  final String prodName;
  final String warehouseId;

  SearchProduct({required this.prodName, required this.warehouseId});
}
