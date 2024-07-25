import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';

class SearchForUsers extends StatefulWidget {
  const SearchForUsers({super.key});

  @override
  State<SearchForUsers> createState() => _SearchForUsersState();
}

class _SearchForUsersState extends State<SearchForUsers> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
          final bloc =context.read<GetAllUsersBloc>();

        return CustomTextField(
          controller: bloc.searchController,
          hintText: 'Search For Users',
          onChanged: (value) {
            bloc.add(GetAllUsersEvent.searchUser(value));
            return null;
          },
          suffixIcon: IconButton(
            onPressed: () {
              bloc.searchController.clear();
              bloc.add(const GetAllUsersEvent.getUsers(isLoading: true));
            },
            icon: const Icon(
              Icons.clear,
              color: ColorsDark.blueDark,
            ),
          ),
        );
      },
    );
  }
}
