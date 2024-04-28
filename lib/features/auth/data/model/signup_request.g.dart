// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestBody _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequestBody(
      json['name'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['avatar'] as String?,
      json['role'] as String?,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.avatar,
      'role': instance.role,
    };
