import 'package:auth/features/otp/domain/entities/otp_entity.dart';
import 'package:auth/features/otp/domain/usecases/otp_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:meta/meta.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpCheckUsecase otpCheckUsecase;

  OtpBloc({required this.otpCheckUsecase}) : super(OtpInitial()) {
    on<DoOtpCheck>(_doOtpCheck);
  }

  _doOtpCheck(DoOtpCheck event, Emitter<OtpState> emit) async {
    emit(Loading());

    final failedOrSuccess = await otpCheckUsecase(OtpCheckParams(
      email: event.email,
      otp: event.otp,
      type: event.type,
    ));

    emit(failedOrSuccess.fold(
        (l) => Error(message: (l as RequestFailure).message),
        (r) => Success(resp: r)));
  }
}
