import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_responce_model.g.dart';

@JsonSerializable()
class UserResponceModel {
  UserResponceModel({required this.data});
  factory UserResponceModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponceModelFromJson(json);
  UserData data;
}

@JsonSerializable()
class UserData {
  UserData({required this.userList});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  @JsonKey(name: 'users')
  final List<UserModel> userList;
}

@JsonSerializable()
class UserModel {
  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  final String? name;
  final String? email;
  final String? id;
}
