import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naroutoshop/core/apps/app_cubit/app_cubit.dart';
import 'package:naroutoshop/core/common/dialog/custom_dialogs.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/app_localizations.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = context.read<AppCubit>();
        return Row(
          children: [
            SvgPicture.asset(
              AppImages.language,
              color: context.textStyle.color,
            ),
            SizedBox(width: 10.w),
            TextApp(
              text: context.translate(LangKeys.languageTilte),
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
                  textBody: context.translate(LangKeys.changeToTheLanguage),
                  textButton1: context.translate(LangKeys.yes),
                  textButton2: context.translate(LangKeys.cancel),
                  isLoading: false,
                  onPressed: () async {
                    await _changeLanguage(context: context, cubit: cubit);
                  },
                );
              },
              child: Row(
                children: [
                  TextApp(
                    text: context.translate(LangKeys.langCode),
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
      },
    );
  }

  Future<void> _changeLanguage({
    required BuildContext context,
    required AppCubit cubit,
  }) async {
    if (AppLocalizations.of(context)!.isEnLocale) {
      cubit.toArabic();
    } else {
      cubit.toEnglish();
    }
    context.pop();
  }
}
