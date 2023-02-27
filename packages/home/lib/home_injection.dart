import 'package:core/core.dart';
import 'package:home/features/home/presentation/bloc/navbar_bloc.dart';

Future<void> init() async {
  // bloc
  sl.registerFactory(() => NavbarBloc());
  // // usecase
  // sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  // // repository
  // sl.registerLazySingleton<LoginRepository>(
  //     () => LoginRepositoryImpl(datasource: sl()));
  // // datasource
  // sl.registerLazySingleton<LoginRemoteDatasource>(
  //   () => LoginRemoteDatasourceImpl(
  //     provider: sl<ApiProvider>(instanceName: 'provider_main'),
  //     sp: sl(),
  //   ),
  // );
}
