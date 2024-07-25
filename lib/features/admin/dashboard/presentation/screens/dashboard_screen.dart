import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/refactors/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductsNumberBloc>()
            ..add(const ProductsNumberEvent.getProductsNumber()),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesNumberBloc>()
            ..add(const CategoriesNumberEvent.getCategoriesNumber()),
        ),
        BlocProvider(
          create: (context) => sl<UsersNumberBloc>()
            ..add(const UsersNumberEvent.getUsersNumber()),
        ),
      ],
      child: Scaffold(
        appBar: AppBarAdmin(
          ismain: true,
          tittle: 'Dashboard',
          backgroundColor: context.color.mainColor!,
        ),
        body: const DashboardBody(),
      ),
    );
  }
}
