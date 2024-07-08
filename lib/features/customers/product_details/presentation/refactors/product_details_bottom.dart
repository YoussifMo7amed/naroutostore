import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/custom_linear_button.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class ProductDetailsBottom extends StatelessWidget {
  const ProductDetailsBottom({required this.price, super.key});
  final double price;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Container(
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.color.containerShadow1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: '\${$price}',
                theme: context.textStyle.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: context.color.bluePinkLight,
                ),
              ),
              CustomLinearButton(
                height: 40.h,
                width: 140.w,
                onPressed: () {},
                child: TextApp(
                  text: 'Add To Cart',
                  theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
