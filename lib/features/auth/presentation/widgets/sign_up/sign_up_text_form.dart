import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';

import 'package:naroutoshop/core/utils/app_regex.dart';


class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
    bool isshowpassword = false;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        //username textform
        CustomFadeInRight(
          duration: 200,
          child: CustomTextField(
            controller: TextEditingController(),
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value== null || value.isEmpty || value.length < 3) {
                return context.translate(LangKeys.fullName);
              }
              return null;
            },
            hintText: context.translate(LangKeys.fullName),
          ),
        ),
        verticalSpace(25.h),
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
        verticalSpace(20.h),
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
        verticalSpace(20.h),       
      ],
    );
  }
}