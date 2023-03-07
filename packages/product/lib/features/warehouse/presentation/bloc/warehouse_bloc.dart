import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';
import 'package:product/features/warehouse/domain/entities/warehouse_entity.dart';
import 'package:product/features/warehouse/domain/usecases/warehouse_usecase.dart';

part 'warehouse_event.dart';
part 'warehouse_state.dart';

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
  final WarehouseUsecase warehouseUsecase;

  WarehouseBloc({required this.warehouseUsecase}) : super(WarehouseInitial()) {
    on<GetWarehouseEvent>(_getWarehouse);
  }

  _getWarehouse(GetWarehouseEvent event, Emitter<WarehouseState> emit) async {
    emit(Loading());

    final failedOrSuccess = await warehouseUsecase(WarehouseParams());

    emit(failedOrSuccess.fold(
        (l) => Error(message: (l as RequestFailure).message),
        (r) => Success(warehouseEntity: r)));
  }
}
