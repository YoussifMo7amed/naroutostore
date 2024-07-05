import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';

class BuildDeveloperSettengs extends StatelessWidget {
  const BuildDeveloperSettengs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildDeveloper,
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.buildDeveloper),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.webView,
                arguments: 'https://www.udemy.com/user/youssef-4188/');
          },
          child: Row(
            children: [
              TextApp(
                text: 'Naruto Store',
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              SizedBox(width: 5.w),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
