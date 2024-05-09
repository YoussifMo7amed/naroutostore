part of 'users_number_bloc.dart';

@freezed
class UsersNumberState with _$UsersNumberState {
  const factory UsersNumberState.loading() = _LoadingState;
  const factory UsersNumberState.success({required String Number})= _SuccessState;
  const factory UsersNumberState.error({required String error}) = _ErrorState;}
