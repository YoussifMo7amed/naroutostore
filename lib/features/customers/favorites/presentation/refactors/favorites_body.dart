import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_product_item.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/customers/favorites/presentation/cubit/favorite_cubit.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final data = context.read<FavoriteCubit>().getFavorites;
          if (data.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline_outlined,
                      size: 150.sp,
                      color: context.color.textColor,
                    ),
                  ),
                  TextApp(
                      text: 'Choose Your Favorite products',
                      theme: context.textStyle.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeightHelper.bold,
                      ))
                ],
              ),
            );
          }
          return GridView.builder(
            itemBuilder: (context, index) {
              return CustomProductItem(
                imageUrl: data[index].image.imageProductFormate(),
                title: data[index].title ?? '',
                categoryName: data[index].categoryName,
                price: double.parse(data[index].price),
                productId: int.parse(data[index].id),
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
          );
        },
      ),
    );
  }
}
