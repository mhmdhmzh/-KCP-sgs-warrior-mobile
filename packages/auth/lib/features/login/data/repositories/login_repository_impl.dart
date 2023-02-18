import 'package:auth/features/login/domain/entities/login_resp_entity.dart';
import 'package:auth/features/login/domain/entities/login_req_entity.dart';
import 'package:auth/features/login/domain/repositories/login_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:core/network/failures.dart';

import '../datasources/remote/login_remote_datasource.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDatasource datasource;

  LoginRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, LoginRespEntity>> login(
      {required LoginReqEntity req}) async {
    try {
      final response = await datasource.doLogin(req: req);
      return Right(response.data!);
    } on DioError catch (e) {
      final responseError = CustomException.fromDioError(e);
      return Left(RequestFailure(message: responseError.message));
    }
  }
}
