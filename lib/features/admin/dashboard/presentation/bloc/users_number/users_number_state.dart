part of 'users_number_bloc.dart';

@freezed
class UsersNumberState with _$UsersNumberState {
  const factory UsersNumberState.loading() = _LoadingState;
  // ignore: non_constant_identifier_names
  const factory UsersNumberState.success({required String Number}) =
      _SuccessState;
  const factory UsersNumberState.error({required String error}) = _ErrorState;
}
