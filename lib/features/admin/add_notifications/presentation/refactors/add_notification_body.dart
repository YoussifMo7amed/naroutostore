import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/widget/add_notification_item.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/widget/create/create_notification.dart';

class AddNotificationsBody extends StatelessWidget {
  const AddNotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          //create category button
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: const CreateNotification(),
          ),
          //add notification items
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const AddNotificationItem();
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.h,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
