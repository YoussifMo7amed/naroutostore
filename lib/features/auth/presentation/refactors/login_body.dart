import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:naroutoshop/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:naroutoshop/features/auth/presentation/widgets/login/login_Button.dart';
import 'package:naroutoshop/features/auth/presentation/widgets/login/login_text_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // dark mode and language
            const DarkAndLangButtons(),
            verticalSpace(50.h),
            //welcome Info
            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              description: context.translate(LangKeys.welcome),
            ),
            verticalSpace(30.h),
            //login textform
            const LoginTextForm(),
               verticalSpace(50.h),
        //login bottun
        const LoginBottun(),
        verticalSpace(20.h),
        //create account text
        CustomFadeInDown(
          duration: 400,
          child: TextButton(onPressed: () {
            context.pushReplacementNamed(Routes.signUp);
          }, 
          child: TextApp(
            text: context.translate(LangKeys.createAccount),
            theme: context.textStyle.copyWith(
              color: context.color.bluePinkLight,
              fontSize: 16.sp,
              fontWeight: FontweightHelper.medium,
            ),
          ),),
        ),
          ],
        ),
      ),
    );
  }
}
