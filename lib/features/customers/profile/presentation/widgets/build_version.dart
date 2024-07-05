import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';
import 'package:naroutoshop/core/utils/app_info.dart';

class BuildVersion extends StatelessWidget {
  const BuildVersion({super.key});

  @override
  Widget build(BuildContext context) {
  return Row(
      children: [
        SvgPicture.asset(
          AppImages.buildVersion,
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.buildVersion),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        FutureBuilder(
          future: AppInfo.getAppVersion(context) , builder: (context, snapshot) {
            if(snapshot.hasData){
              return TextApp(
                text: snapshot.data.toString(),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              );
            }else{
              return TextApp(
                text: '1.0.0',
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              );
            }
          },)
      ],
    );
  }
}