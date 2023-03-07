part of 'product_card_bloc.dart';

@immutable
abstract class ProductCardEvent {}

class GetProductCard extends ProductCardEvent {
  final String productId;

  GetProductCard({required this.productId});
}
