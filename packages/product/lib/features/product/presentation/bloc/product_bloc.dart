import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:product/features/product/domain/usecases/product_usecase.dart';

import '../../domain/entities/top_product_entity.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUsecase productUsecase;
  final TopProductUsecase topProductUsecase;
  final SearchProductUsecase searchProduct;

  ProductBloc({
    required this.productUsecase,
    required this.searchProduct,
    required this.topProductUsecase,
  }) : super(ProductInitial()) {
    on<GetProduct>(_getProduct);
    on<SearchProduct>(_searchProduct);
    on<GetTopProduct>(_getTopProduct);
    on<GetProductCard>(_getProductCard);
  }

  _getProduct(GetProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    final failedOrSuccess = await productUsecase(ProductParams());

    emit(failedOrSuccess.fold(
        (l) => ProductError(message: (l as RequestFailure).message),
        (r) => ProductSuccess(products: r)));
  }

  _searchProduct(SearchProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    final failedOrSuccess = await searchProduct(SearchProductParams(
        prodName: event.prodName, warehouseId: event.warehouseId));

    emit(failedOrSuccess.fold(
        (l) => ProductError(message: (l as RequestFailure).message),
        (r) => ProductSuccess(products: r)));
  }

  _getTopProduct(GetTopProduct event, Emitter<ProductState> emit) async {
    emit(TopProductLoading());

    final failedOrSuccess = await topProductUsecase(ProductParams());

    emit(failedOrSuccess.fold(
        (l) => TopProductError(message: (l as RequestFailure).message),
        (r) => TopProductSuccess(products: r)));
  }

  _getProductCard(GetProductCard event, Emitter<ProductState> emit) async {
    emit(ProductCardLoading());

    final failedOrSuccess = await searchProduct(SearchProductParams(
        prodName: event.prodName, warehouseId: event.warehouseId));

    emit(failedOrSuccess.fold(
        (l) => ProductCardError(message: (l as RequestFailure).message),
        (r) => ProductCardSuccess(product: r)));
  }
}
