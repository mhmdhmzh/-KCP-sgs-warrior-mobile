import 'package:auth/features/pin/domain/entities/pin_entity.dart';
import 'package:auth/features/pin/domain/usecases/pin_usecase.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class PinRepository {
  Future<Either<Failure, PinRespEntity>> doPinCheck(
      {required PinCheckParams params});
  Future<Either<Failure, bool>> doResendOtp({required ResendOTPParams params});
}
