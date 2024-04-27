part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _LoadingState;
  const factory AuthState.error({required String error}) = _ErrorState;
  const factory AuthState.success({required String userRole}) = _SuccessState;
}
