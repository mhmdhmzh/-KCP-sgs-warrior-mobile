import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:auth/features/register/domain/usecases/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ProvinceUsecase provinceUsecase;

  RegisterBloc({
    required this.provinceUsecase,
  }) : super(RegisterInitial()) {
    on<GetRegion>(_getProvince);
  }

  _getProvince(GetRegion event, Emitter<RegisterState> emit) async {
    emit(RegionLoading());

    final failedOrSuccess = await provinceUsecase(ProvinceParams());

    emit(
      failedOrSuccess.fold(
        (l) => RegionError(message: (l as RequestFailure).message),
        (r) => RegionSuccess(regionEntity: r),
      ),
    );
  }
}
