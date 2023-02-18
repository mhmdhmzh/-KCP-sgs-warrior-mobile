import 'package:core/core.dart';

import 'features/login/data/datasources/remote/login_remote_datasource.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentation/bloc/login_bloc.dart';

Future<void> init() async {
  // bloc
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  // repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(datasource: sl()));
  // datasource
  sl.registerLazySingleton<LoginRemoteDatasource>(
    () => LoginRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
      sp: sl(),
    ),
  );
}
