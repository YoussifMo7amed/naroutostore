import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/custom_linear_button.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class SaveFilterBottom extends StatelessWidget {
  const SaveFilterBottom({required this.onTap, super.key});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 300,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: CustomLinearButton(
          height: 30.h,
          width: 100.w,
          onPressed: onTap,
          child: TextApp(
            text: 'Save ',
            theme: context.textStyle.copyWith(
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
