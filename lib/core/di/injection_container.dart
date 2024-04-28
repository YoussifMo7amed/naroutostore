import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:naroutoshop/core/apps/app_cubit/app_cubit.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/apps/uploadimage/datasource/upload_image_datasource.dart';
import 'package:naroutoshop/core/apps/uploadimage/repo/upload_image_repo.dart';
import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/dio_factory.dart';
import 'package:naroutoshop/features/auth/data/data_source/auth_data_source.dart';
import 'package:naroutoshop/features/auth/data/repos/auth_repo.dart';
import 'package:naroutoshop/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  sl
    ..registerSingleton(AppCubit())
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
