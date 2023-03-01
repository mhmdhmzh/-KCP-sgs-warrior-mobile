import 'package:auth/features/register/data/models/register_model.dart';
import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:auth/features/register/domain/entities/register_entity.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegionEntity>> getRegion();
  Future<Either<Failure, RegisterRespEntity>> doRegister(
      {required RegisterReqEntity req});
}
