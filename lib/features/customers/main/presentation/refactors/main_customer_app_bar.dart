import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/custom_linear_button.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/enums/nav_bar_enum.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';
import 'package:naroutoshop/features/customers/main/presentation/bloc/nav_bar/nav_bar_cubit.dart';

class MainCustomerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MainCustomerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        final cubit = context.watch<NavBarCubit>();
        if (cubit.navBar == NavBarEnum.home) {
          return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.color.mainColor,
            surfaceTintColor: context.color.mainColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: context.translate(LangKeys.chooseProducts),
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
                  ),
                ),
                CustomFadeInLeft(
                  duration: 800,
                  child: CustomLinearButton(
                    onPressed: () {
                      context.pushNamed(Routes.search);
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        AppImages.search,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (cubit.navBar == NavBarEnum.favorites) {
          return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.color.mainColor,
            surfaceTintColor: context.color.mainColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: 'Your Favorites',
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (cubit.navBar == NavBarEnum.notifications) {
          return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.color.mainColor,
            surfaceTintColor: context.color.mainColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: 'Notifications',
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
