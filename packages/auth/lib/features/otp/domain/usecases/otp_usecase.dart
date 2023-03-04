import 'package:auth/features/otp/domain/entities/otp_entity.dart';
import 'package:auth/features/otp/domain/repositories/otp_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class OtpCheckUsecase implements UseCase<UserEntity, OtpCheckParams> {
  final OtpRepository repository;

  OtpCheckUsecase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(OtpCheckParams params) async {
    return await repository.doOtpCheck(params: params);
  }
}

class OtpCheckParams {
  final String email;
  final String otp;
  final String type;

  OtpCheckParams({required this.email, required this.otp, required this.type});
}
