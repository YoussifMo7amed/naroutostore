import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_responce.g.dart';
@JsonSerializable()
class UserRoleResponce {

  UserRoleResponce(this.userrole);

  factory UserRoleResponce.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponceFromJson(json);
  @JsonKey(name: 'role')
  final String? userrole;
}
