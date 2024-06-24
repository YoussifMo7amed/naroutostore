import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/create/create_category.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/product_admin_list.dart';

class AddProductsBody extends StatelessWidget {
  const AddProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateCategory(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: verticalSpace(20.h),
                  ),
                  SliverToBoxAdapter(
                    child: GridView.builder(
                      itemBuilder: (context, index) {
                        return const ProductAdminList(
                          image:
                              'https://images.unsplash.com/photo-1718027808460-7069cf0ca9ae?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8',
                          title: 'MacBookAir',
                          categoryName: 'Electronics',
                          price: '1000',
                        );
                      },
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 15,
                        childAspectRatio: 165 / 250,
                      ),
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
