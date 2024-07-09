import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_customer.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/features/customers/categories/presentation/bloc/get_category/get_category_bloc.dart';
import 'package:naroutoshop/features/customers/categories/presentation/refactor/category_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.categoryInfo, super.key});
  final ({String categoryName, int categoryId}) categoryInfo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetCategoryBloc>()
        ..add(
          GetCategoryEvent.getCategory(categoryId: categoryInfo.categoryId),
        ),
      child: Scaffold(
        appBar: AppBarCustomer(tittle: categoryInfo.categoryName),
        body: const CategoryBody(),
      ),
    );
  }
}
