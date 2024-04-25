import 'package:dio/dio.dart';
import 'package:naroutoshop/features/auth/data/model/login_responce.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphql = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphql)
  Future<LoginResponce> login(
    @Body() Map<String, dynamic> mutation,
  );
  @GET('/api/v1/auth/profile')
  Future<UserRoleResponce> userRole();
}
