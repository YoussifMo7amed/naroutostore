import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';
import 'package:naroutoshop/features/customers/profile/data/repo/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._repo) : super(const ProfileState.loading()) {
    on<GetUserInfoEvent>(_getUserProfile);
  }
  final ProfileRepo _repo;
  FutureOr<void> _getUserProfile(
    GetUserInfoEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final result = await _repo.getUserInfo();
    result.when(
      success: (userInfo) {
        emit(ProfileState.success(userInfoModel: userInfo));
      },
      failure: (error) {
        emit(ProfileState.error(error: error));
      },
    );
  }
}
