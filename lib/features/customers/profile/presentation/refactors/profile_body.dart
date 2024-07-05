import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/customers/profile/presentation/bloc/profile/profile_bloc.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                      error: Text.new);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
