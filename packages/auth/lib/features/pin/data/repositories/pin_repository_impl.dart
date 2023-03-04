import 'package:auth/features/pin/data/datasources/remote/pin_remote_datasource.dart';
import 'package:auth/features/pin/data/models/pin_model.dart';
import 'package:auth/features/pin/domain/entities/pin_entity.dart';
import 'package:auth/features/pin/domain/repositories/pin_repository.dart';
import 'package:auth/features/pin/domain/usecases/pin_usecase.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class PinRepositoryImpl extends PinRepository {
  final PinRemoteDatasource datasource;

  PinRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, PinRespEntity>> doPinCheck(
      {required PinCheckParams params}) async {
    try {
      final response = await datasource.doPinCheck(params: params);
      return Right(response.data!);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }

  @override
  Future<Either<Failure, bool>> doResendOtp(
      {required ResendOTPParams params}) async {
    try {
      final response = await datasource.doResendOtp(params: params);
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
