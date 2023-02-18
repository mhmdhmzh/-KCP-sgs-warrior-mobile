import 'package:auth/features/login/domain/entities/login_req_entity.dart';
import 'package:auth/features/login/domain/entities/login_resp_entity.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginRespEntity>> login({required LoginReqEntity req});
}
