import 'package:auth/features/otp/data/datasources/remote/otp_remote_datasource.dart';
import 'package:auth/features/otp/data/repositories/otp_repository_impl.dart';
import 'package:auth/features/otp/domain/repositories/otp_repository.dart';
import 'package:auth/features/otp/domain/usecases/otp_usecase.dart';
import 'package:auth/features/pin/data/datasources/remote/pin_remote_datasource.dart';
import 'package:auth/features/pin/data/repositories/pin_repository_impl.dart';
import 'package:auth/features/pin/domain/repositories/pin_repository.dart';
import 'package:auth/features/pin/domain/usecases/pin_usecase.dart';
import 'package:auth/features/pin/presentation/bloc/pin_bloc.dart';
import 'package:auth/features/register/data/datasources/remote/register_remote_datasource.dart';
import 'package:auth/features/register/domain/repositories/register_repository.dart';
import 'package:auth/features/register/domain/usecases/register_usecase.dart';
import 'package:core/core.dart';

import 'features/login/data/datasources/remote/login_remote_datasource.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/otp/presentation/bloc/otp_bloc.dart';
import 'features/register/data/repositories/register_repository_impl.dart';
import 'features/register/presentation/bloc/register_bloc.dart';

Future<void> init() async {
  // bloc
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));
  sl.registerFactory(() => OtpBloc(otpCheckUsecase: sl()));
  sl.registerFactory(() => PinBloc(
        pinCheckUsecase: sl(),
        resendOtpUsecase: sl(),
      ));
  sl.registerFactory(() => RegisterBloc(
        regionUsecase: sl(),
        registerUsecase: sl(),
      ));
  // usecase
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton(() => RegionUsecase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));
  sl.registerLazySingleton(() => OtpCheckUsecase(repository: sl()));
  sl.registerLazySingleton(() => PinCheckUsecase(repository: sl()));
  sl.registerLazySingleton(() => ResendOtpUsecase(repository: sl()));
  // repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<OtpRepository>(
      () => OtpRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<PinRepository>(
      () => PinRepositoryImpl(datasource: sl()));
  // datasource
  sl.registerLazySingleton<LoginRemoteDatasource>(
    () => LoginRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
      sp: sl(),
    ),
  );
  sl.registerLazySingleton<OtpRemoteDatasource>(
    () => OtpRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
      sp: sl(),
    ),
  );
  sl.registerLazySingleton<PinRemoteDatasource>(
    () => PinRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
      sp: sl(),
    ),
  );
  sl.registerLazySingleton<RegisterRemoteDatasource>(
    () => RegisterRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
    ),
  );
}
