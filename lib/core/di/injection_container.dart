import 'package:get_it/get_it.dart';
import 'package:naroutoshop/core/apps/app_cubit/app_cubit.dart';
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
  sl
    ..registerSingleton(AppCubit())
    ..registerLazySingleton<ApiService>(() => ApiService(dio));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}
