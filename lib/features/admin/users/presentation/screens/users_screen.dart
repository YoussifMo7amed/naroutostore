import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:naroutoshop/features/admin/users/presentation/refactors/user_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<GetAllUsersBloc>()
              ..add(const GetAllUsersEvent.getUsers(isLoading: true)),),
      ],
      child: Scaffold(
        appBar: AppBarAdmin(
          ismain: true,
          tittle: 'Users',
          backgroundColor: context.color.mainColor!,
        ),
        body: const UsersBody(),
      ),
    );
  }
}
