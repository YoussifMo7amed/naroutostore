import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/loading/empty_page.dart';
import 'package:naroutoshop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:naroutoshop/features/admin/users/presentation/widgets/search_for_users.dart';
import 'package:naroutoshop/features/admin/users/presentation/widgets/table_for_users.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          //Search For User
          const SearchForUsers(),
          SizedBox(
            height: 20.h,
          ),
          Flexible(
            child: RefreshIndicator(
              onRefresh: () async {
                context
                    .read<GetAllUsersBloc>()
                    .add(const GetAllUsersEvent.getUsers(isLoading: true));
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                          success: (usersList) {
                            return TableForUsers(
                              usersList: usersList,
                            );
                          },
                          empty: EmptyPage.new,
                          error: Text.new,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10.h,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
