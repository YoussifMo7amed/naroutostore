import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';
import 'package:naroutoshop/features/customers/profile/data/data_source/profile_datasource.dart';

class ProfileRepo {
  final ProfileDatasource _datasource;
  ProfileRepo(this._datasource);
  Future<ApiResult<UserRoleResponce>> getUserInfo() async {
    try {
      final responce = await _datasource.getUserInfo();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure('Please try again later, Something went wrong');
    }
  }
}
