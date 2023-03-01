import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:auth/features/register/domain/entities/register_entity.dart';
import 'package:auth/features/register/domain/repositories/register_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class RegionUsecase implements UseCase<RegionEntity, RegionParams> {
  final RegisterRepository repository;

  RegionUsecase({required this.repository});

  @override
  Future<Either<Failure, RegionEntity>> call(RegionParams params) async {
    return await repository.getRegion();
  }
}

class RegisterUsecase
    implements UseCase<RegisterRespEntity, RegisterReqEntity> {
  final RegisterRepository repository;

  RegisterUsecase({required this.repository});

  @override
  Future<Either<Failure, RegisterRespEntity>> call(
      RegisterReqEntity req) async {
    return await repository.doRegister(req: req);
  }
}

class RegionParams {}
