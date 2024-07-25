import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_product_item.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/features/customers/search/presntation/bloc/search_Product/search_product_bloc.dart';
import 'package:naroutoshop/features/customers/search/presntation/widgets/filter_bottoms.dart';
import 'package:naroutoshop/features/customers/search/presntation/widgets/search_for_data.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          //filter bottoms
          const FilterBottoms(),
          SizedBox(height: 20.h),
          //search for data
          BlocBuilder<SearchProductBloc, SearchProductState>(
            builder: (context, state) {
              return state.when(initial: () {
                return const SizedBox.shrink();
              }, loading: () {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.color.textColor,
                    ),
                  ),
                );
              }, success: (productsList) {
                return Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                      return CustomProductItem(
                        imageUrl: productsList[index]
                            .images!
                            .first
                            .imageProductFormate(),
                        title: productsList[index].title ?? '',
                        categoryName: productsList[index].category!.name ?? '',
                        price: productsList[index].price ?? 0,
                        productId: int.parse(productsList[index].id ?? '0'),
                      );
                    },
                    itemCount: productsList.length,
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
              }, error: (error) {
                return Center(
                  child: Text(error),
                );
              }, empty: () {
                return const SearchForData(
                  text: 'No Products Found',
                );
              },);
            },
          ),
        ],
      ),
    );
  }
}
