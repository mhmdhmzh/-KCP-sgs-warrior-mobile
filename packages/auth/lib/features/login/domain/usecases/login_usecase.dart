import 'package:auth/features/login/domain/entities/login_resp_entity.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/login_req_model.dart';
import '../repositories/login_repository.dart';

class LoginUsecase implements UseCase<LoginRespEntity, LoginParams> {
  final LoginRepository repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, LoginRespEntity>> call(LoginParams params) async {
    final req = LoginReqModel(email: params.email, media: params.media);
    return await repository.login(req: req);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String media;

  LoginParams(this.email, this.media);

  @override
  List<Object?> get props => [email, media];
}
