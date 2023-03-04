import 'package:auth/features/register/data/datasources/remote/register_remote_datasource.dart';
import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:auth/features/register/domain/entities/register_entity.dart';
import 'package:auth/features/register/domain/repositories/register_repository.dart';
import 'package:auth/features/register/presentation/bloc/register_bloc.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:core/network/failures.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDatasource datasource;

  RegisterRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, RegionEntity>> getRegion() async {
    try {
      final response = await datasource.getRegion();
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }

  @override
  Future<Either<Failure, RegisterRespEntity>> doRegister(
      {required RegisterReqEntity req}) async {
    try {
      final response = await datasource.doRegister(req: req);
      return Right(response);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
