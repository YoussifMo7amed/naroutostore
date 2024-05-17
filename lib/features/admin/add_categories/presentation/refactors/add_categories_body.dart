import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/create/create_category.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          //create category button
          SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: const CreateCategory()),

          //add category items
          Expanded(
            child: RefreshIndicator(
              color: ColorsDark.blueLight,
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: verticalSpace(20.h),
                  ),
                  SliverToBoxAdapter(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const AddCategoryItems(
                          name: 'MacBook Pro',
                          image:
                              'https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111339_sp818-mbp13touch-space-select-202005.png',
                          categoryId: '1',
                        );
                      },
                      separatorBuilder: (context, index) => verticalSpace(15.h),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
