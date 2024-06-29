import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/users/data/datasource/users_admin_datasource.dart';
import 'package:naroutoshop/features/admin/users/data/model/user_responce_model.dart';

class UsersRepo {
  UsersRepo(this._dataSource);
  final UsersDataSource _dataSource;

  Future<ApiResult<UserResponceModel>> getAllUsers() async {
    try {
      final responce = await _dataSource.getAllUsers();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
}
