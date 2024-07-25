import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_customer.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/features/customers/search/presntation/bloc/search_Product/search_product_bloc.dart';
import 'package:naroutoshop/features/customers/search/presntation/refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl< SearchProductBloc>(),
      child: const Scaffold(
        appBar: AppBarCustomer(tittle: 'Search'),
        body: SearchBody(),
      ),
    );
  }
}
