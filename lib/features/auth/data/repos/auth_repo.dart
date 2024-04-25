import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/auth/data/data_source/auth_data_source.dart';
import 'package:naroutoshop/features/auth/data/model/login_request.dart';
import 'package:naroutoshop/features/auth/data/model/login_responce.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';

class AuthRepos {
  AuthRepos(this._dataSource);

  final AuthDataSource _dataSource;

  Future<ApiResult<LoginResponce>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body);
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure('Please try again, Something went wrong');
    }
  }

  Future<UserRoleResponce> userRole(String token) async {
    final response = await _dataSource.getUserRole(token);
    return response;
  }
}
