part of 'product_card_bloc.dart';

@immutable
abstract class ProductCardState {}

class ProductCardInitial extends ProductCardState {}

class Loading extends ProductCardState {}

class Success extends ProductCardState {
  final ProductCardEntity data;

  Success({required this.data});
}

class Error extends ProductCardState {
  final String message;

  Error({required this.message});
}

class Empty extends ProductCardState {}
