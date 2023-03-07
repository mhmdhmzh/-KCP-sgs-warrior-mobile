import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';
import 'package:product/features/product/domain/entities/product_entity.dart';
import 'package:product/features/product/domain/usecases/product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUsecase productUsecase;
  final SearchProductUsecase searchProduct;

  ProductBloc({
    required this.productUsecase,
    required this.searchProduct,
  }) : super(ProductInitial()) {
    on<GetProduct>(_getProduct);
    on<SearchProduct>(_searchProduct);
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
}
