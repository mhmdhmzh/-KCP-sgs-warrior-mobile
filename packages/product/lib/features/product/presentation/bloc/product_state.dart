part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

//get product
class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final ProductEntity products;

  ProductSuccess({required this.products});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}

class ProductEmpty extends ProductState {}

//search product
class SearchProductLoading extends ProductState {}

class SearchProductSuccess extends ProductState {
  final ProductEntity products;

  SearchProductSuccess({required this.products});
}

class SearchProductError extends ProductState {
  final String message;

  SearchProductError({required this.message});
}

class SearchProductEmpty extends ProductState {}
