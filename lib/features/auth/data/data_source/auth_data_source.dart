import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/auth/auth_queries.dart';
import 'package:naroutoshop/features/auth/data/model/login_request.dart';
import 'package:naroutoshop/features/auth/data/model/login_responce.dart';
import 'package:naroutoshop/features/auth/data/model/signup_request.dart';
import 'package:naroutoshop/features/auth/data/model/singup_responce.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';

class AuthDataSource {
  AuthDataSource(this._graphql);

  final ApiService _graphql;

  Future<LoginResponce> login(LoginRequestBody body) async {
    final response =
        await _graphql.login(AuthQueries().loginMapQuery(body: body));
    return response;
  }
  Future<UserRoleResponce> getUserRole(String token) async {
    final dio=Dio();
    dio.options.headers['authorization'] = 'Bearer $token';
    final client = ApiService( dio);
    final response = await client.userRole();
    debugPrint('UserRole=>>>>> ${response.userrole  }');
    return response;
  }
    Future<SignUpResponce> signUp(SignUpRequestBody body) async {
    final response =
        await _graphql.signUp(AuthQueries().signUpMapQuery(body: body));
    return response;
  }
}
