import 'package:auth/features/otp/domain/entities/otp_entity.dart';
import 'package:auth/features/otp/domain/usecases/otp_usecase.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class OtpRepository {
  Future<Either<Failure, UserEntity>> doOtpCheck(
      {required OtpCheckParams params});
}
