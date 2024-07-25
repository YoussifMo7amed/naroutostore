import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naroutoshop/core/common/dialog/custom_dialogs.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';
import 'package:naroutoshop/core/utils/app_logout.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
  return Row(
      children: [
        SvgPicture.asset(
          AppImages.logout,
   color: context.textStyle.color,   
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.logOut),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
         InkWell(
          onTap: () {
            CustomDialog.twoButtonDialog(
            context: context,
            textBody: context.translate(LangKeys.logOutFromApp),
            textButton1: context.translate(LangKeys.yes),
            textButton2:  context.translate(LangKeys.no),
            isLoading: false,
            onPressed: () async {
          await AppLogout().logout();
            },
          );
          },
          child: Row(
            children: [
              TextApp(
                text:context.translate(LangKeys.logOut).toLowerCase() ,
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
