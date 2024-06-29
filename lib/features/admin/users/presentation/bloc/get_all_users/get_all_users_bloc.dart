import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/users/data/model/user_responce_model.dart';
import 'package:naroutoshop/features/admin/users/data/repo/users_repo.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';
part 'get_all_users_bloc.freezed.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  GetAllUsersBloc(this._repo) : super(const GetAllUsersState.loading()) {
    on<FetchAllUsers>(_getAllUsers);
  }
  final UsersRepo _repo;
  FutureOr<void> _getAllUsers(FetchAllUsers event,Emitter<GetAllUsersState> emit) async{
    if(event.isLoading){
      emit(const GetAllUsersState.loading());
    }
    final result = await _repo.getAllUsers();
    result.when(
      success: (users) {
        if (users.data.userList.isEmpty) {
          emit(const GetAllUsersState.empty());
        } else {
          emit(GetAllUsersState.success(users: users.data.userList));
        }
      },
      failure: (error) {
        emit(GetAllUsersState.error(error: error));
      }
    );
  }
}
