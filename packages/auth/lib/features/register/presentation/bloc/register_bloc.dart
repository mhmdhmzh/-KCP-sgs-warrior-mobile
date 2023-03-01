import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:auth/features/register/domain/entities/register_entity.dart';
import 'package:auth/features/register/domain/usecases/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegionUsecase regionUsecase;
  final RegisterUsecase registerUsecase;

  RegisterBloc({
    required this.regionUsecase,
    required this.registerUsecase,
  }) : super(RegisterInitial()) {
    on<GetRegion>(_getProvince);
    on<DoRegister>(_doRegister);
  }

  _getProvince(GetRegion event, Emitter<RegisterState> emit) async {
    emit(RegionLoading());

    final failedOrSuccess = await regionUsecase(RegionParams());

    emit(
      failedOrSuccess.fold(
        (l) => RegionError(message: (l as RequestFailure).message),
        (r) => RegionSuccess(regionEntity: r),
      ),
    );
  }

  _doRegister(DoRegister event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());

    final failedOrSuccess = await registerUsecase(event.req);

    emit(
      failedOrSuccess.fold(
        (l) => RegisterError(message: (l as RequestFailure).message),
        (r) => RegisterSuccess(registerRespEntity: r),
      ),
    );
  }
}
