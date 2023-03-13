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

// top product

class TopProductLoading extends ProductState {}

class TopProductSuccess extends ProductState {
  final TopProductEntity products;

  TopProductSuccess({required this.products});
}

class TopProductError extends ProductState {
  final String message;

  TopProductError({required this.message});
}

class TopProductEmpty extends ProductState {}

// top product

class ProductCardLoading extends ProductState {}

class ProductCardSuccess extends ProductState {
  final ProductEntity product;

  ProductCardSuccess({required this.product});
}

class ProductCardError extends ProductState {
  final String message;

  ProductCardError({required this.message});
}

class ProductCardEmpty extends ProductState {}
