import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/service/shared_pref/pref_keys.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';
import 'package:naroutoshop/features/auth/data/model/login_request.dart';
import 'package:naroutoshop/features/auth/data/model/signup_request.dart';
import 'package:naroutoshop/features/auth/data/repos/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const _Initial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
  }
  final AuthRepos _repo;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );
    await result.when(
      success: (loginData) async {
        final token = loginData.data.login.accessToken ?? '';
        await SharedPref().setString(PrefKeys.accessToken, token);
        final user = await _repo.userRole(token);
        await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
        await SharedPref().setString(PrefKeys.userRole, user.userrole ?? '');
        emit(AuthState.success(userRole: user.userrole ?? ''));
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }

  //signUp method
  FutureOr<void> _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _repo.signup(
      SignUpRequestBody(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        avatar: event.imageUrl,
      ),
    );
     result.when(
      success: (signupData)  {
        add(const AuthEvent.login());
      },
      failure: (error) {
        emit(AuthState.error(error: error));
      },
    );
  }
}
