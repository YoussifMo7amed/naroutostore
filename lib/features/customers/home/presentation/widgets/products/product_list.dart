import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_product_item.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';

class ProductList extends StatelessWidget {
  const ProductList({required this.productList, super.key});
  final List<ProductGetAllModel> productList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        itemBuilder: (context, index) {
          return CustomProductItem(
            imageUrl: productList[index].images!.first.imageProductFormate(),
            title: productList[index].title ?? '',
            categoryName: productList[index].category!.name,
            price: productList[index].price ?? 0,
            productId: int.parse(productList[index].id ?? '0'),
          );
        },
        itemCount: productList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            // ignore: lines_longer_than_80_chars
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 15,
          childAspectRatio: 165 / 250,
        ),
      ),
    );
  }
}
