import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegionEntity>> getProvince();
}
