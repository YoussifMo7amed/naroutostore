import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/create/add_category_item.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/create/create_category.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        //create category button
        CreateCategory(),
        //add category items
        verticalSpace(10.h),

        AddCategoryItems(
          name: 'MacBook Pro',
          image:
              'https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111339_sp818-mbp13touch-space-select-202005.png',
          categoryId: '1',
        ),
      ],
    );
  }
}
