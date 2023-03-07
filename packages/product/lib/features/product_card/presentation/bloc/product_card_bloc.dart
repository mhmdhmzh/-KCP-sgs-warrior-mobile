import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';
import 'package:product/features/product_card/domain/entities/product_card_entity.dart';

import '../../domain/usecases/product_card_usecase.dart';

part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  final ProductCardUsecase productCardUsecase;
  ProductCardBloc({required this.productCardUsecase})
      : super(ProductCardInitial()) {
    on<GetProductCard>(_getProductCard);
  }

  _getProductCard(GetProductCard event, Emitter<ProductCardState> emit) async {
    emit(Loading());

    final failedOrdSuccess =
        await productCardUsecase(ProductCardParams(productId: event.productId));

    emit(failedOrdSuccess.fold(
        (l) => Error(message: (l as RequestFailure).message),
        (r) => Success(data: r)));
  }
}
