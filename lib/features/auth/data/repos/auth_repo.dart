import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/auth/data/data_source/auth_data_source.dart';
import 'package:naroutoshop/features/auth/data/model/login_request.dart';
import 'package:naroutoshop/features/auth/data/model/login_responce.dart';
import 'package:naroutoshop/features/auth/data/model/signup_request.dart';
import 'package:naroutoshop/features/auth/data/model/singup_responce.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';

class AuthRepos {
  AuthRepos(this._dataSource);

  final AuthDataSource _dataSource;

  Future<ApiResult<LoginResponce>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body);
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }

  Future<UserRoleResponce> userRole(String token) async {
    final response = await _dataSource.getUserRole(token);
    return response;
  }
  //signup
    Future<ApiResult<SignUpResponce>> signup(SignUpRequestBody body) async {
    try {
      final response = await _dataSource.signUp(body: body);
      return ApiResult.success(response);
    } catch (error) {
      return  ApiResult.failure('This is the error =>>> $error');
    }
  }
}
