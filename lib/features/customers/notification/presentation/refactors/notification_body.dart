import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/customers/notification/presentation/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return NotificationItem();
          },
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: 10),
    );
  }
}
