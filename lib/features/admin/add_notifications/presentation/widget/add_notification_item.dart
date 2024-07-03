import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_admin.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/date_extention.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/widget/edit/edit_notification.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({required this.model, super.key});
  final AddNotificationModel model;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            NotificationInfo(
              title: 'Title:',
              body: model.title,
            ),
            const Spacer(),
            NotificationInfo(
              title: 'Body:',
              body: model.body,
            ),
            const Spacer(),
            NotificationInfo(
              title: 'Created At:',
              body: model.createdAt.formattedDate,
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
                const EditNotification(),
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
