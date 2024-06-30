import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/users_admin_queries.dart';
import 'package:naroutoshop/features/admin/users/data/model/user_responce_model.dart';

class UsersDataSource {
  UsersDataSource(this._graphql);
  final ApiService _graphql;
//get all users
  Future<UserResponceModel> getAllUsers() async {
    final responce = await _graphql.getAllUsers(
      UsersAdminQueries().getAllUsersMapQuery(),
    );
    return responce;
  }

  Future<void> deleteUser({required String userId}) async {
    final responce = await _graphql.deleteUser(
      UsersAdminQueries().deleteUser(userId: userId),
    );
    return responce;
  }
}
