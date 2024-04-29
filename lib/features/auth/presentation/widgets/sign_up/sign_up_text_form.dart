import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';

import 'package:naroutoshop/core/utils/app_regex.dart';
import 'package:naroutoshop/features/auth/presentation/bloc/auth_bloc.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() => _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isshowpassword = false;
  late AuthBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    _bloc.nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          //username textform
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.nameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
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
              controller: _bloc.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
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
              controller: _bloc.passwordController,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return null;
              },
              hintText: context.translate(LangKeys.password),
              obscureText: !isshowpassword,
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
      ),
    );
  }
}
