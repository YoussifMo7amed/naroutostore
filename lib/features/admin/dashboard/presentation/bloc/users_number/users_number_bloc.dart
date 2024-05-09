import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'users_number_event.dart';
part 'users_number_state.dart';
part 'users_number_bloc.freezed.dart';

class UsersNumberBloc extends Bloc<UsersNumberEvent, UsersNumberState> {
  UsersNumberBloc(this._repo) : super(_LoadingState()) {
    on<UsersNumberEvent>(_usersNumber);
  }
  final DashboardRepo _repo;

  FutureOr<void> _usersNumber(
      UsersNumberEvent event, Emitter<UsersNumberState> emit) async {
    emit(const UsersNumberState.loading());
    final result = await _repo.numberOfUsers();
    result.when(
      success: (usersData) {
        emit(UsersNumberState.success(Number:usersData.number ));
      },
      failure: (error) {
        emit(UsersNumberState.error(error: error));
      },
    );
  }
}
