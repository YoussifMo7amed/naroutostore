import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_customer.dart';

class ViewAllProductsScreen extends StatelessWidget {
  const ViewAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomer(tittle:  'View All Products'
      ),
    );
  }
}