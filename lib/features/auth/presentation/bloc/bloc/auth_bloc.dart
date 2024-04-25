import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/service/shared_pref/pref_keys.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';
import 'package:naroutoshop/features/auth/data/model/login_request.dart';
import 'package:naroutoshop/features/auth/data/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
  }
  final AuthRepos _repo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );
    await result.when(success: (loginData) async {
      final token = loginData.data.login.accessToken ?? '';
      await SharedPref().setString(PrefKeys.accessToken, token);
      final user = await _repo.userRole(token);
      await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
      emit( AuthState.success(userRole: user.userrole??''));  
    }, failure: (error) {
      emit(AuthState.error(error: error));
    });
  }
}
