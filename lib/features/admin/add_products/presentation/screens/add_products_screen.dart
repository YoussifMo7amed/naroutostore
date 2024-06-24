import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/refactors/add_products_body.dart';

class AddProductsScreen extends StatelessWidget {
  const AddProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAdmin(
        ismain: true,
        tittle: 'Products',
        backgroundColor: context.color.mainColor!,
      ),
      body: const AddProductsBody(),
    );
  }
}
