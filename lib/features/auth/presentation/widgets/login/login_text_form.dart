import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/utils/app_regex.dart';
import 'package:naroutoshop/features/auth/presentation/widgets/login/login_Button.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isshowpassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //email textform
        CustomFadeInRight(
          duration: 200,
          child: CustomTextField(
            controller: TextEditingController(),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (AppRegex.isEmailValid('')) {
                return context.translate(LangKeys.validEmail);
              }
              return null;
            },
            hintText: context.translate(LangKeys.email),
          ),
        ),
        verticalSpace(25.h),
        //password textform
        CustomFadeInRight(
          duration: 200,
          child: CustomTextField(
            controller: TextEditingController(),
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return context.translate(LangKeys.validPasswrod);
              }
              return null;
            },
            hintText: context.translate(LangKeys.password),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isshowpassword = !isshowpassword;
                });
              },
              icon: Icon(
                isshowpassword ? Icons.visibility : Icons.visibility_off,
             color: context.color.textColor,
              ),
            ),
          ),
        ),
        verticalSpace(50.h),
        //login bottun
        const LoginBottun(),
        verticalSpace(20.h),
        //create account text
        CustomFadeInDown(
          duration: 400,
          child: TextApp(
            text: context.translate(LangKeys.createAccount),
            theme: context.textStyle.copyWith(
              color: context.color.bluePinkLight,
              fontSize: 16.sp,
              fontWeight: FontweightHelper.medium,
            ),
          ),
        ),
      ],
    );
  }
}
