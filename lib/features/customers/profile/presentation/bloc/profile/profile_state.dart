part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _LoadingState;
    const factory ProfileState.success({required UserRoleResponce userInfoModel}) = _SuccessState;
      const factory ProfileState.error({required String error}) = _ErrorState;







}
