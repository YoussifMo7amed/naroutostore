import 'package:json_annotation/json_annotation.dart';
part 'login_responce.g.dart';

@JsonSerializable()
class LoginResponce {
  LoginResponce(this.data);

  factory LoginResponce.fromJson(Map<String, dynamic> json) =>
      _$LoginResponceFromJson(json);
  LoginDataModel data;
}

@JsonSerializable()
class LoginDataModel {
  LoginDataModel(this.login);

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
  LoginModel login;
}

@JsonSerializable()
class LoginModel {
  LoginModel({required this.accessToken, required this.refreshToken});
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
}
