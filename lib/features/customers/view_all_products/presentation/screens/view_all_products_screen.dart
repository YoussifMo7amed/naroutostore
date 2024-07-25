import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_customer.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/features/customers/view_all_products/presentation/bloc/view_all_products/view_all_products_bloc.dart';
import 'package:naroutoshop/features/customers/view_all_products/presentation/bloc/view_all_products/view_all_products_event.dart';
import 'package:naroutoshop/features/customers/view_all_products/presentation/refactor/view_all_body.dart';

class ViewAllProductsScreen extends StatelessWidget {
  const ViewAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<ViewAllProductsBloc>()..add(
        const GetProductsViewAllEvent(),
      ),
      child: const Scaffold(
        appBar: AppBarCustomer(tittle: 'View All Products'),
        body: ViewAllBody(),
      ),
    );
  }
}
