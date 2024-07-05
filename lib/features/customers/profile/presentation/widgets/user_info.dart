import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/auth/data/model/user_role_responce.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({required this.userInfoModel, super.key});
  final UserRoleResponce userInfoModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: CachedNetworkImage(
            height: 80.h,
            width: 80.w,
            imageUrl: userInfoModel.userimage!,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 70,
            ),
          ),
        ),
        SizedBox(height: 7.h),
        TextApp(
          text: userInfoModel.userName!.toLowerCase().toCapitalized(),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 7.h),
        TextApp(
          text: userInfoModel.userEmail!,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
