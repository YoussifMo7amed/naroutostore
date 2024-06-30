// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponceModel _$UserResponceModelFromJson(Map<String, dynamic> json) =>
    UserResponceModel(
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponceModelToJson(UserResponceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userList: (json['users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'users': instance.userList,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
    };
