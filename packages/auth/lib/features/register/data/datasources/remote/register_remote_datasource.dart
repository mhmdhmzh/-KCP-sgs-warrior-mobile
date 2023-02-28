import 'package:core/core.dart';

import '../../models/region_model.dart';

abstract class RegisterRemoteDatasource {
  Future<RegionModel> getProvince();
}

class RegisterRemoteDatasourceImpl extends RegisterRemoteDatasource {
  final ApiProvider provider;

  RegisterRemoteDatasourceImpl({required this.provider});

  @override
  Future<RegionModel> getProvince() async {
    final responseProvince = await provider.get(
      'provinsi',
      options: Options(),
    );
    final responsePlace = await provider.get(
      'place',
      options: Options(),
    );

    if (responseProvince.statusCode == 200 && responsePlace.statusCode == 200) {
      ProvinceModel province = ProvinceModel.fromJson(responseProvince.data);
      PlaceModel place = PlaceModel.fromJson(responsePlace.data);

      final result = RegionModel.create(
        provinceModel: province,
        placeModel: place,
      );

      return result;
    } else {
      throw ServerException();
    }
  }
}
