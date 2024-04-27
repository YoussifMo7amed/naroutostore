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

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isshowpassword = true;
  late final AuthBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
   
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_bloc.formKey,
      child: Column(
        children: [
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
          verticalSpace(25.h),
          //password textform
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              obscureText: isshowpassword,
              controller: _bloc.passwordController,
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
                  !isshowpassword ? Icons.visibility : Icons.visibility_off,
                  color: context.color.textColor,
                ),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
