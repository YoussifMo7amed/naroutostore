import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:naroutoshop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';

class DeleteUser extends StatelessWidget {
  const DeleteUser({
    required this.userId,
    super.key,
  });
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: BlocConsumer<DeleteUserBloc, DeleteUserState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              context
                  .read<GetAllUsersBloc>()
                  .add(const GetAllUsersEvent.getUsers(isLoading: false));
              ShowToast.showToastSuccessTop(
                  message: 'User Deleted Successfully',);
            },
            error: (message) {
              ShowToast.showToastErrorTop(message: message);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: (id) {
              if (id == userId) {
                return Center(
                  child: SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                );
              }
            },
            orElse: () {
              return IconButton(
                onPressed: () {
                  context
                      .read<DeleteUserBloc>()
                      .add(DeleteUserEvent.deleteUser(userId: userId));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
