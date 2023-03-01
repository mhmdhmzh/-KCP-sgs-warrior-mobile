import 'package:auth/features/register/data/models/register_model.dart';
import 'package:auth/features/register/domain/entities/register_entity.dart';
import 'package:core/core.dart';

import '../../models/region_model.dart';

abstract class RegisterRemoteDatasource {
  Future<RegionModel> getRegion();
  Future<BaseResponse<RegisterRespModel>> doRegister(
      {required RegisterReqEntity req});
}

class RegisterRemoteDatasourceImpl extends RegisterRemoteDatasource {
  final ApiProvider provider;

  RegisterRemoteDatasourceImpl({required this.provider});

  @override
  Future<RegionModel> getRegion() async {
    final responseProvince = await provider.get('provinsi');
    final responsePlace = await provider.get('place');
    final responseSubdistrict = await provider.get('subdistrict');

    if (responseProvince.statusCode == 200 &&
        responsePlace.statusCode == 200 &&
        responseSubdistrict.statusCode == 200) {
      final result = RegionModel.fromJson(
        jsonProvince: responseProvince.data,
        jsonPlace: responsePlace.data,
        jsonSubdistrict: responseSubdistrict.data,
      );

      return result;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<BaseResponse<RegisterRespModel>> doRegister(
      {required RegisterReqEntity req}) async {
    Map<String, dynamic> data = {
      'photo': req.avatar64,
      'photo_ktp': req.idCard64,
      'fullname': req.name,
      'email': req.email,
      'phone': req.phone,
      'gender': req.sex,
      'birth_date': req.dob,
      'place_id': req.placeId,
      'subdistrict_id': req.subdistrictId,
    };

    final response = await provider.post('register', data: data);

    if (response.statusCode != null && response.statusCode == 200) {
      final result = BaseResponse<RegisterRespModel>.fromJson(
        response.data,
        (resp) => RegisterRespModel.fromJson(response.data),
      );
      return result;
    } else {
      throw ServerException();
    }
  }
}
