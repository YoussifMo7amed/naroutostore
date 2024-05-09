import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_admin.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class DashBoardContainer extends StatelessWidget {
  const DashBoardContainer({
    required this.title,
    required this.number,
    required this.image,
    required this.isloading,
    super.key,
  });
  final String title;
  final String number;
  final String image;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: title,
                  theme: context.textStyle.copyWith(
                    fontSize: 24.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontweightHelper.bold,
                  ),
                ),
                const Spacer(),
                if (isloading)
                  LoadingShimmer(
                    height: 30.h,
                    width: 100.w,
                  )
                else
                  TextApp(
                    text: number,
                    theme: context.textStyle.copyWith(
                      fontSize: 24.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontweightHelper.bold,
                    ),
                  ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 90.h, child: Image.asset(image)),
          ],
        ),
      ),
    );
  }
}
