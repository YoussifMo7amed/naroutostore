import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/delete_category/delete_category_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/refactors/add_categories_body.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllCategoriesAdminBloc>()
            ..add(
              const GetAllCategoriesAdminEvent.fetchAdminCategories(
                isNotLoading: true,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<DeleteCategoryBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBarAdmin(
          ismain: true,
          tittle: 'Categories',
          backgroundColor: context.color.mainColor!,
        ),
        body: const Column(
          children: [
            Expanded(child: AddCategoriesBody()),
          ],
        ),
      ),
    );
  }
}
