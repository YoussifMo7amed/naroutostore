import 'package:freezed_annotation/freezed_annotation.dart';
part 'singup_responce.g.dart';

@JsonSerializable()
class SignUpResponce {
  factory SignUpResponce.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponceFromJson(json);

  const SignUpResponce(this.data);
  final SignUpDataModel? data;
}

@JsonSerializable()
class SignUpDataModel {
  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpDataModelFromJson(json);

  const SignUpDataModel(this.addUser);
  final AddUserModel? addUser;
}

@JsonSerializable()
class AddUserModel {
  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
      
  const AddUserModel(this.id, this.email);
  final int? id;
  final String? email;
}
