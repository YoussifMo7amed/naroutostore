import 'package:get_it/get_it.dart';
import 'package:naroutoshop/core/apps/app_cubit/app_cubit.dart';
import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/dio_factory.dart';

final s1 = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  s1
    ..registerSingleton(AppCubit())
    ..registerLazySingleton<ApiService>(() => ApiService(dio));
}
