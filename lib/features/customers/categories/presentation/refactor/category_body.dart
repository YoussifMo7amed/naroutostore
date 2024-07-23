import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_product_item.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/core/loading/empty_page.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';
import 'package:naroutoshop/features/customers/categories/presentation/bloc/get_category/get_category_bloc.dart';


class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryBloc, GetCategoryState>(
        builder: (context, state) {
      return state.when(
        loading: () {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return LoadingShimmer(
                  height: 250.h,
                  width: 165.w,
                );
              },
              itemCount: 8,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 15,
                childAspectRatio: 165 / 250,
              ),
            ),
          );
        },
        success: (data) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return CustomProductItem(
                  imageUrl: data[index].images!.first.imageProductFormate(),
                  title: data[index].title ?? '',
                  categoryName: data[index].category?.name ?? '',
                  price: data[index].price ?? 0.0,
                  productId: int.parse(data[index].id ?? '0'),
                );
              },
              itemCount: data.length,
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
        },
        empty: () {
          return const EmptyPage();
        },
        error: (error) {
          return Text(error);
        },
      );
    },);
  }
}
