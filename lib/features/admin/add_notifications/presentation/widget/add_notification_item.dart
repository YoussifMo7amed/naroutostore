import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_admin.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            const NotificationInfo(
              title: 'Title:',
              body: 'ojpiohuigy',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Body:',
              body: 'ojpiohuigy',
            ),
            const Spacer(),
            const NotificationInfo(
              title: 'Created At:',
              body: '2-7-2024',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //delete button
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 20.sp,
                ),
                SizedBox(
                  width: 40.w,
                ),
                //edit button
                Icon(
                  Icons.edit,
                  color: Colors.yellow,
                  size: 20.sp,
                ),
                SizedBox(
                  width: 40.w,
                ),
                //send button
                Icon(
                  Icons.send,
                  color: Colors.green,
                  size: 20.sp,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({required this.title, required this.body, super.key});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextApp(
        text: title,
        theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
            color: Colors.white),
      ),
      SizedBox(
        width: 8.w,
      ),
      Flexible(
        child: TextApp(
          text: body,
          theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              fontFamily: FontFamilyHelper.poppinsEnglish,
              fontWeight: FontWeightHelper.medium,
              color: ColorsDark.blueLight),
        ),
      ),
    ]);
  }
}
