import 'package:auth/features/pin/domain/entities/pin_entity.dart';
import 'package:auth/features/pin/domain/usecases/pin_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'pin_event.dart';
part 'pin_state.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  final PinCheckUsecase pinCheckUsecase;
  final ResendOtpUsecase resendOtpUsecase;

  PinBloc({
    required this.pinCheckUsecase,
    required this.resendOtpUsecase,
  }) : super(PinInitial()) {
    on<DoPinCheck>(_doPinCheck);
    on<DoResendOtp>(_doResendOtp);
  }

  _doPinCheck(DoPinCheck event, Emitter<PinState> emit) async {
    emit(Loading());

    final failedOrdSuccess = await pinCheckUsecase(PinCheckParams(
        email: event.email,
        pin: event.pin,
        type: event.token,
        isCreate: event.isCreate));

    emit(failedOrdSuccess.fold(
        (l) => Error(message: (l as RequestFailure).message),
        (r) => Success(pinRespEntity: r)));
  }

  _doResendOtp(DoResendOtp event, Emitter<PinState> emit) async {
    emit(Loading());

    final failedOrdSuccess = await resendOtpUsecase(ResendOTPParams(
      email: event.email,
    ));

    emit(failedOrdSuccess.fold(
        (l) => ResendOTPError(message: (l as RequestFailure).message),
        (r) => ResendOTPSuccess(isSuccess: r)));
  }
}
