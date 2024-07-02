import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/widget/create/create_notification.dart';

class AddNotificationsBody extends StatelessWidget {
  const AddNotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return 
Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          //create category button
          SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: const CreateNotification(),),
       
        ],
      ),
    );
  }
}
