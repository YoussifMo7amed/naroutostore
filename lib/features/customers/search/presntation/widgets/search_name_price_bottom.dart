import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class SearchNamePriceBottom extends StatelessWidget {
  const SearchNamePriceBottom({
    required this.onTap,
    required this.isSelected,
    required this.title,
    super.key,
  });
  final VoidCallback onTap;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 140.w,
        decoration: BoxDecoration(
          color:
              isSelected ? context.color.bluePinkDark : context.color.navBarbg,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ),
    );
  }
}
