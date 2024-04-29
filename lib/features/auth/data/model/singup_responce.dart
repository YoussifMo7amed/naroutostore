import 'package:freezed_annotation/freezed_annotation.dart';
part 'singup_responce.g.dart';

@JsonSerializable()
class SignUpResponce {

  const SignUpResponce(this.data);
  factory SignUpResponce.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponceFromJson(json);
  final SignUpDataModel data;
}

@JsonSerializable()
class SignUpDataModel {

  const SignUpDataModel(this.addUser);
  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataModelFromJson(json);
  final AddUserModel addUser;
}

@JsonSerializable()
class AddUserModel {
      
  const AddUserModel(this.id, this.email);
  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
  final String? id;
  final String? email;
}
