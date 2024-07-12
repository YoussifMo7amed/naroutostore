import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/customers/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/build_developer_settengs.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/build_version.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/change_dark_mode.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/language_change.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/log_out.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/notification_settings.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/user_info.dart';
import 'package:naroutoshop/features/customers/profile/presentation/widgets/user_info_shimmer.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100.h),
            Center(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return state.when(
                    loading: () {
                      return const UserInfoShimmer();
                    },
                    success: (userInfo) {
                      return UserInfo(
                        userInfoModel: userInfo,
                      );
                    },
                    error: Text.new,
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            TextApp(
              text: context.translate(LangKeys.applicationFeatures),
              theme: context.textStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 30.h),
            //Language change
            const CustomFadeInRight(
              duration: 400,
              child: LanguageChange()),
            SizedBox(height: 30.h),
            //Dark mode
            const CustomFadeInRight(
              duration: 400,
              child: ChangeDarkMode(),),
            SizedBox(height: 30.h),
            // Build Developer Settings
            const CustomFadeInRight(
              duration: 400,
              child: BuildDeveloperSettengs(),
            ),
            SizedBox(height: 30.h),
            // Notification Settings
            const CustomFadeInRight(
              duration: 400,
              child:NotificationsSettings(),
            ),
            SizedBox(height: 30.h),
            //Build Version
            const BuildVersion(),
            SizedBox(height: 30.h),
            //LogOut
            const LogOut(),            

          ],
        ),
      ),
    );
  }
}
