import 'package:auth/features/register/data/datasources/remote/register_remote_datasource.dart';
import 'package:auth/features/register/domain/repositories/register_repository.dart';
import 'package:auth/features/register/domain/usecases/register_usecase.dart';
import 'package:core/core.dart';

import 'features/login/data/datasources/remote/login_remote_datasource.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/register/data/repositories/register_repository_impl.dart';
import 'features/register/presentation/bloc/register_bloc.dart';

Future<void> init() async {
  // bloc
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));
  sl.registerFactory(() => RegisterBloc(provinceUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton(() => ProvinceUsecase(repository: sl()));
  // repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(datasource: sl()));
  // datasource
  sl.registerLazySingleton<LoginRemoteDatasource>(
    () => LoginRemoteDatasourceImpl(
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
