import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_role_responce.g.dart';

@JsonSerializable()
class UserRoleResponce {
  UserRoleResponce(this.userrole, this.userId, this.userName, this.userimage,
      this.userEmail,);

  factory UserRoleResponce.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponceFromJson(json);
  @JsonKey(name: 'role')
  final String? userrole;
  @JsonKey(name: 'id')
  final int? userId;

  @JsonKey(name: 'name')
  final String? userName;

  @JsonKey(name: 'email')
  final String? userEmail;

  @JsonKey(name: 'avatar')
  final String? userimage;
}
