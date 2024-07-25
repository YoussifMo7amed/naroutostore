// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/users/data/repo/users_repo.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';
part 'delete_user_bloc.freezed.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  DeleteUserBloc(this._repo) : super(const _Initial()) {
    on<DeleteUsersEvent>(_delete_user);
  }
  final UsersRepo _repo;
  FutureOr<void> _delete_user(
    DeleteUsersEvent event,
    Emitter<DeleteUserState> emit,
  ) async {
    emit(DeleteUserState.loading(userId: event.userId));
    final result = await _repo.deleteUser(userId: event.userId);
    result.when(
      success: (value) {
        emit(const DeleteUserState.success());
      },
      failure: (error) {
        emit(DeleteUserState.error(error: error));
      },
    );
  }
}
