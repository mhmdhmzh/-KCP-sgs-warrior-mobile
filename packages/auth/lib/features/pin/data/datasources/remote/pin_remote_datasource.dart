import 'package:auth/features/pin/data/models/pin_model.dart';
import 'package:auth/features/pin/domain/entities/pin_entity.dart';
import 'package:auth/features/pin/domain/usecases/pin_usecase.dart';
import 'package:core/core.dart';

abstract class PinRemoteDatasource {
  Future<BaseResponse<PinRespModel>> doPinCheck(
      {required PinCheckParams params});
  Future<bool> doResendOtp({required ResendOTPParams params});
}

class PinRemoteDatasourceImpl extends PinRemoteDatasource {
  final ApiProvider provider;
  final SharedPreferences sp;

  PinRemoteDatasourceImpl({required this.provider, required this.sp});

  @override
  Future<BaseResponse<PinRespModel>> doPinCheck(
      {required PinCheckParams params}) async {
    final data = {
      'email': params.email,
      'pin': params.pin,
      'token': params.type
    };
    final response = await provider.post(
      params.isCreate ? 'pin-create' : 'pin-check',
      data: data,
      options: Options(),
    );

    if (response.statusCode != null && response.statusCode == 200) {
      final result = BaseResponse<PinRespModel>.fromJson(
        response.data,
        (resp) => PinRespModel.fromJson(response.data),
      );
      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> doResendOtp({required ResendOTPParams params}) async {
    final response = await provider.get(
      'otp-resend/register/${params.email}',
    );

    if (response.statusCode != null && response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }
}
