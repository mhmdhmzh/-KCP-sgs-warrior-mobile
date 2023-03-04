import 'package:auth/features/otp/data/models/otp_model.dart';
import 'package:auth/features/otp/domain/usecases/otp_usecase.dart';
import 'package:core/core.dart';

abstract class OtpRemoteDatasource {
  Future<BaseResponse<UserModel>> doOtpCheck({required OtpCheckParams params});
}

class OtpRemoteDatasourceImpl extends OtpRemoteDatasource {
  final ApiProvider provider;
  final SharedPreferences sp;

  OtpRemoteDatasourceImpl({required this.provider, required this.sp});

  @override
  Future<BaseResponse<UserModel>> doOtpCheck(
      {required OtpCheckParams params}) async {
    final data = {
      'email': params.email,
      'otp': params.otp,
      'type': params.type
    };
    final response = await provider.post(
      'otp-check',
      data: data,
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = BaseResponse<UserModel>.fromJson(
        response.data,
        (resp) => UserModel.fromJson(response.data),
      );
      return result;
    } else {
      throw ServerException();
    }
  }
}
