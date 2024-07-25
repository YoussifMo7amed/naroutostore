import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_favorite_bottom.dart';
import 'package:naroutoshop/core/common/widgets/custom_share_bottom.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/customers/favorites/presentation/cubit/favorite_cubit.dart';
import 'package:naroutoshop/features/customers/product_details/data/model/product_details_responce.dart';
import 'package:naroutoshop/features/customers/product_details/widgets/product_details_slider.dart';

class PtoductDetailsBody extends StatelessWidget {
  const PtoductDetailsBody({required this.productModel, super.key});
  final ProductDetailsModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //share botton
                CustomShareBottom(size: 30.h),
                //wishlist button
                BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return CustomFavoriteBottom(
                      size: 30.h,
                      isFavorite: context
                          .read<FavoriteCubit>()
                          .isFavorite(productModel.id.toString()),
                      onTap: () {
                        context.read<FavoriteCubit>().addtoFavorites(
                              productId: productModel.id.toString(),
                              title: productModel.title ?? '',
                              image: productModel.images.first
                                  .imageProductFormate(),
                              price: productModel.price.toString(),
                              categoryName: productModel.category!.name,
                            );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            // product details slider
            ProductDetailsSlider(
              imagesList: productModel.images,
            ),

            SizedBox(height: 30.h),

            //product details
            TextApp(
              text: productModel.title ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
                color: context.color.textColor,
              ),
            ),

            SizedBox(height: 15.h),

            TextApp(
              text: productModel.description ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
                color: context.color.textColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
