import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/refactors/add_products_body.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllProductsAdminBloc>()
            ..add(
              const FetchAllProductsAdminEvent(
                isLoading: true,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => sl<DeleteProductBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBarAdmin(
          ismain: true,
          tittle: 'Products',
          backgroundColor: context.color.mainColor!,
        ),
        body: const AddProductsBody(),
      ),
    );
  }
}
