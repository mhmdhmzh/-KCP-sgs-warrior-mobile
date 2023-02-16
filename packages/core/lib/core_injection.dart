import 'package:core/common/utils/device_info.dart';
import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flavor_config.dart';

Future<void> init() async {
  //core
  final deviceInfo = await DeviceInfoPlugin().deviceInfo;
  final platformDeviceId = await PlatformDeviceId.getDeviceId;
  sl.registerLazySingleton<DeviceInfo>(() => DeviceInfoImpl(
        deviceInfo: deviceInfo,
        platformDeviceId: platformDeviceId!,
      ));
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<CustomInterceptor>(
      () => CustomInterceptor(sp: sl()));
  sl.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
            dio: sl(instanceName: 'dio_api'),
            baseUrl: FlavorConfig.instance.baseUrl,
            interceptor: sl(),
          ),
      instanceName: 'dio_api');
  //external
  final sp = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sp);
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio(), instanceName: 'dio_api');
}
