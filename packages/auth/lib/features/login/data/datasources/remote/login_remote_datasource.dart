import 'package:auth/features/login/data/models/login_resp_model.dart';
import 'package:auth/features/login/domain/entities/login_req_entity.dart';
import 'package:auth/features/login/domain/entities/login_resp_entity.dart';
import 'package:core/core.dart';

abstract class LoginRemoteDatasource {
  Future<BaseResponse<LoginRespModel>> doLogin({required LoginReqEntity req});
}

class LoginRemoteDatasourceImpl extends LoginRemoteDatasource {
  final ApiProvider provider;
  final SharedPreferences sp;

  LoginRemoteDatasourceImpl({required this.provider, required this.sp});

  @override
  Future<BaseResponse<LoginRespModel>> doLogin(
      {required LoginReqEntity req}) async {
    final data = {'email': req.email, 'media': req.media};
    final response = await provider.post(
      'login',
      data: data,
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = BaseResponse<LoginRespModel>.fromJson(
        response.data,
        (resp) => LoginRespModel.fromJson(response.data),
      );
      return result;
    } else {
      throw ServerException();
    }
  }
}
