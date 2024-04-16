import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:naroutoshop/features/auth/presentation/widgets/dark_and_lang_buttons.dart';

import '../widgets/login/login_text_form.dart';

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
            LoginTextForm(),
          ],
        ),
      ),
    );
  }
}
