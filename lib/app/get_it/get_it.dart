import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:wasil_flutter_task/features/home/data/data_sources/products_remote_data_source.dart';
import 'package:wasil_flutter_task/features/home/data/product_repo_impl/product_repo_impl.dart';
import 'package:wasil_flutter_task/features/home/domain/repository/product_repo.dart';
import 'package:wasil_flutter_task/features/home/domain/usecases/get_product_usecase.dart';
import 'package:wasil_flutter_task/features/home/presentation/blocs/products_cubit.dart';

import '../../core/common/services/dialog/dialog_service.dart';
import '../../core/common/services/url_launcher/url_launcher_service.dart';
import '../../core/network/client/dio_client.dart';
import '../../core/theme/theme_cubit/theme_cubit.dart';

final logger = Logger(
  printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
);
final GlobalKey<NavigatorState> navKey = GlobalKey();
final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  //? Dio Client
  serviceLocator.registerSingleton<DioClient>(DioClient());

  //? Services
  serviceLocator.registerLazySingleton(() => DialogService());
  serviceLocator.registerLazySingleton(() => UrlLauncherService());

  //? Cubits
  serviceLocator.registerLazySingleton(() => ThemeCubit());

  //  ? Products Feature
  serviceLocator
    ..registerFactory<ProductsRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(),
    )
    ..registerFactory<ProductRepo>(() => ProductsRepoImpl())
    ..registerFactory(() => GetProductsUsecase())
    ..registerLazySingleton(() => ProductsCubit());
}
