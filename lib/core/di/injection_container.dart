import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:naroutoshop/core/apps/app_cubit/app_cubit.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/apps/uploadimage/datasource/upload_image_datasource.dart';
import 'package:naroutoshop/core/apps/uploadimage/repo/upload_image_repo.dart';
import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/dio_factory.dart';
import 'package:naroutoshop/features/admin/add_categories/data/datasource/all_categories__admin_datasource.dart';
import 'package:naroutoshop/features/admin/add_categories/data/repo/get_all_categories_repo.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/add_category/add_category_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/delete_category/delete_category_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/update_category/update_category_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:naroutoshop/features/admin/dashboard/data/repos/dashboard_repo.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:naroutoshop/features/auth/data/data_source/auth_data_source.dart';
import 'package:naroutoshop/features/auth/data/repos/auth_repo.dart';
import 'package:naroutoshop/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  await _initAuth();
  await _initDashboard();
  await _initCategoriesAdmin();
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

Future<void> _initDashboard() async {
  sl
    ..registerLazySingleton(() => DashboardDataSource(sl()))
    ..registerLazySingleton(() => DashboardRepo(sl()))
    ..registerFactory(() => ProductsNumberBloc(sl()))
    ..registerFactory(() => CategoriesNumberBloc(sl()))
    ..registerFactory(() => UsersNumberBloc(sl()));
}

Future<void> _initCategoriesAdmin() async {
  sl
    ..registerLazySingleton(() => GetAllCategoriesDataSource(sl()))
    ..registerLazySingleton(() => GetAllCategoriesRepo(sl()))
    ..registerFactory(() => GetAllCategoriesAdminBloc(sl()))
    ..registerFactory(() => AddCategoryBloc(sl()))
    ..registerFactory(() => DeleteCategoryBloc(sl()))
    ..registerFactory(
      () => UpdateCategoryBloc(sl()),
    );
}
