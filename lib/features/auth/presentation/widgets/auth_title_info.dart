import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              color: context.color.textColor,
              fontSize: 24.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          verticalSpace(10.h),
          TextApp(
            text: description,
            theme: context.textStyle.copyWith(
              color: context.color.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.medium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
