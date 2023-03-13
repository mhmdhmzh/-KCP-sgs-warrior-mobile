import 'package:core/core.dart';
import 'package:product/features/category/data/datasources/remote/category_remote_datasource.dart';
import 'package:product/features/category/data/repositories/category_repository_impl.dart';
import 'package:product/features/category/domain/repositories/category_repository.dart';
import 'package:product/features/category/domain/usecases/category_usecase.dart';
import 'package:product/features/category/presentation/bloc/category_bloc.dart';
import 'package:product/features/product/data/datasources/remote/product_remote_datasource.dart';
import 'package:product/features/product/data/repositories/product_repository_impl.dart';
import 'package:product/features/product/domain/repositories/product_repository.dart';
import 'package:product/features/product/domain/usecases/product_usecase.dart';
import 'package:product/features/product/presentation/bloc/product_bloc.dart';
import 'package:product/features/warehouse/data/datasources/remote/warehouse_remote_datasource.dart';
import 'package:product/features/warehouse/data/repositories/warehouse_repository_impl.dart';
import 'package:product/features/warehouse/domain/repositories/warehouse_repository.dart';
import 'package:product/features/warehouse/domain/usecases/warehouse_usecase.dart';
import 'package:product/features/warehouse/presentation/bloc/warehouse_bloc.dart';

import 'features/product_card/data/datasources/remote/product_card_remote_datasource.dart';
import 'features/product_card/data/repositories/product_card_repository_impl.dart';
import 'features/product_card/domain/repositories/product_card_repository.dart';

import 'features/product_card/presentation/bloc/product_card_bloc.dart';

Future<void> init() async {
  // bloc
  sl.registerFactory(() => ProductBloc(
        productUsecase: sl(),
        searchProduct: sl(),
        topProductUsecase: sl(),
      ));
  sl.registerFactory(() => ProductCardBloc(productCardUsecase: sl()));
  sl.registerFactory(() => WarehouseBloc(warehouseUsecase: sl()));
  sl.registerFactory(() => CategoryBloc(categoryUsecase: sl()));
  // usecase
  sl.registerLazySingleton(() => ProductUsecase(repository: sl()));
  sl.registerLazySingleton(() => TopProductUsecase(repository: sl()));
  sl.registerLazySingleton(() => ProductCardUsecase(repository: sl()));
  sl.registerLazySingleton(() => SearchProductUsecase(repository: sl()));
  sl.registerLazySingleton(() => WarehouseUsecase(repository: sl()));
  sl.registerLazySingleton(() => CategoryUsecase(repository: sl()));
  // repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<ProductCardRepository>(
      () => ProductCardRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<WarehouseRepository>(
      () => WarehouseRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(datasource: sl()));
  // datasource
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
    ),
  );
  sl.registerLazySingleton<ProductCardRemoteDatasource>(
    () => ProductCardRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
    ),
  );
  sl.registerLazySingleton<WarehouseRemoteDatasource>(
    () => WarehouseRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
    ),
  );
  sl.registerLazySingleton<CategoryRemoteDatasource>(
    () => CategoryRemoteDatasourceImpl(
      provider: sl<ApiProvider>(instanceName: 'provider_main'),
    ),
  );
}
