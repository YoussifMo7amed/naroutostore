import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
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
    on<SearchForUser>(_searchUser);
  }
  final UsersRepo _repo;
  final TextEditingController searchController = TextEditingController();
  List<UserModel> usersList = [];
  FutureOr<void> _getAllUsers(
      FetchAllUsers event, Emitter<GetAllUsersState> emit) async {
    if (event.isLoading) {
      emit(const GetAllUsersState.loading());
    }
    final result = await _repo.getAllUsers();
    result.when(
      success: (users) {
        if (users.data.userList.isEmpty) {
          emit(const GetAllUsersState.empty());
        } else {
          usersList = users.data.userList;
          emit(GetAllUsersState.success(users: usersList));
        }
      },
      failure: (error) {
        emit(GetAllUsersState.error(error: error));
      },
    );
  }

  FutureOr<void> _searchUser(
      SearchForUser event, Emitter<GetAllUsersState> emit) async {
    final searchresult = usersList
        .where(
          (element) =>
              element.name!
                  .toLowerCase()
                  .trim()
                  .startsWith(event.searchName!.toLowerCase().trim()) ||
              element.email!
                  .toLowerCase()
                  .trim()
                  .startsWith(event.searchName!.toLowerCase().trim()),
        )
        .toList();
    if (searchresult.isEmpty) {
      emit(const GetAllUsersState.empty());
    } else {
      emit(GetAllUsersState.success(users: searchresult));
    }
  }
}
