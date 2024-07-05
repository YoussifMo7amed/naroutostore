import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';

class ProfileDatasource {
  ProfileDatasource(this._api);
  final ApiService _api;

  Future<UserRoleResponce> getUserInfo() async {
    final responce = await _api.userRole();
    return responce;
  }
}
