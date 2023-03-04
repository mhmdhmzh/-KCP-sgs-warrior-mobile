import 'package:auth/features/pin/domain/entities/pin_entity.dart';
import 'package:auth/features/pin/domain/repositories/pin_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class PinCheckUsecase implements UseCase<PinRespEntity, PinCheckParams> {
  final PinRepository repository;

  PinCheckUsecase({required this.repository});

  @override
  Future<Either<Failure, PinRespEntity>> call(PinCheckParams params) async {
    return await repository.doPinCheck(params: params);
  }
}

class ResendOtpUsecase implements UseCase<bool, ResendOTPParams> {
  final PinRepository repository;

  ResendOtpUsecase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ResendOTPParams params) async {
    return await repository.doResendOtp(params: params);
  }
}

class PinCheckParams {
  final String email;
  final String pin;
  final String type;
  final bool isCreate;

  PinCheckParams(
      {required this.email,
      required this.pin,
      required this.type,
      required this.isCreate});
}

class ResendOTPParams {
  final String email;

  ResendOTPParams({
    required this.email,
  });
}
