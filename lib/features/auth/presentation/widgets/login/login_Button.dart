import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/common/widgets/custom_linear_button.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/auth/presentation/bloc/auth_bloc.dart';

class LoginBottun extends StatelessWidget {
  const LoginBottun({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.loggedSuccessfully),
            );
            if (userRole == 'admin') {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.adminHome, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.customerHome, (route) => false);
            }
          },
          error: (message) {
            ShowToast.showToastErrorTop(
              message: context.translate(message),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  )),
            );
          },
          orElse: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    _validateThenDoLogin(context);
                  },
                  child: TextApp(
                      text: context.translate(LangKeys.login),
                      theme: context.textStyle.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontweightHelper.bold,
                          color: Colors.white))),
            );
          },
        );
      },
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(const AuthEvent.login());
    }
  }
}
