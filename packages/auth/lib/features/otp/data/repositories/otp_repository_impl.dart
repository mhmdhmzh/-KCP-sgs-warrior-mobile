import 'package:auth/features/otp/data/datasources/remote/otp_remote_datasource.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import 'package:core/network/failures.dart';

import 'package:auth/features/otp/domain/usecases/otp_usecase.dart';

import 'package:auth/features/otp/domain/entities/otp_entity.dart';

import '../../domain/repositories/otp_repository.dart';

class OtpRepositoryImpl extends OtpRepository {
  final OtpRemoteDatasource datasource;

  OtpRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, UserEntity>> doOtpCheck(
      {required OtpCheckParams params}) async {
    try {
      final response = await datasource.doOtpCheck(params: params);
      return Right(response.data!);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
