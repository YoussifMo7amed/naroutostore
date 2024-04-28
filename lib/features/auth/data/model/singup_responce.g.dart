// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singup_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponce _$SignUpResponceFromJson(Map<String, dynamic> json) =>
    SignUpResponce(
      json['data'] == null
          ? null
          : SignUpDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponceToJson(SignUpResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SignUpDataModel _$SignUpDataModelFromJson(Map<String, dynamic> json) =>
    SignUpDataModel(
      json['addUser'] == null
          ? null
          : AddUserModel.fromJson(json['addUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpDataModelToJson(SignUpDataModel instance) =>
    <String, dynamic>{
      'addUser': instance.addUser,
    };

AddUserModel _$AddUserModelFromJson(Map<String, dynamic> json) => AddUserModel(
      json['id'] as int?,
      json['email'] as String?,
    );

Map<String, dynamic> _$AddUserModelToJson(AddUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
    };
