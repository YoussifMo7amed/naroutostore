import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_customer.dart';
import 'package:naroutoshop/features/customers/search/presntation/refactors/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustomer(tittle: 'Search'),
      body: SearchBody(),
    );
  }
}
