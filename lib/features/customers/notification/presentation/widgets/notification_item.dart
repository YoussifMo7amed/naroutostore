import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    // required this.title,
    // required this.body,
    // required this.createdAt,
    // required this.isSeen,
    // required this.onTapSelected,
    // required this.onTapRemoved,
    super.key,
  });

  // final String title;
  // final String body;
  // final String createdAt;
  // final bool isSeen;
  // final VoidCallback onTapSelected;
  // final VoidCallback onTapRemoved;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      // onTap: onTapSelected,
      onTap: () {
        
      },
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,   // isSeen ? Colors.grey : Colors.white,
            width: 1.5,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.notification,
            color: Colors.pink,
            height: 30.h,
          ),
        ),
      ),
      //Title
      title: TextApp(
        // text: title,
        text: 'title',
        theme: context.textStyle.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeightHelper.medium,
          color:  Colors.white, // isSeen ? Colors.grey : Colors.white,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          //Body
          TextApp(
            text: 'body',
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.medium,
              color:Colors.white // isSeen ? Colors.grey : Colors.white,
            ),
          ),
          SizedBox(height: 5.h),
          //created at
          TextApp(
            text: 'createdAt',
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.medium,
              color: Colors.white, //isSeen ? Colors.grey : Colors.green,
            ),
          ),
          SizedBox(height: 5.h),
          Divider(
            color: Colors.white, // isSeen ? Colors.grey : Colors.white,
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap:(){},// onTapRemoved,
        child: const Icon(
          Icons.close,
          color: Colors.yellow,
          size: 20,
        ),
      ),
    );
  }
}
