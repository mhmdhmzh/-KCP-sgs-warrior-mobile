import 'package:auth/features/register/domain/entities/region_entity.dart';
import 'package:auth/features/register/domain/repositories/register_repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class ProvinceUsecase implements UseCase<RegionEntity, ProvinceParams> {
  final RegisterRepository repository;

  ProvinceUsecase({required this.repository});

  @override
  Future<Either<Failure, RegionEntity>> call(ProvinceParams params) async {
    return await repository.getProvince();
  }
}

class ProvinceParams {}
