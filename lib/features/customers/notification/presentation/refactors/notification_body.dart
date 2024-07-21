import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/service/shared_pref/pref_keys.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/utils/app_strings.dart';
import 'package:naroutoshop/features/customers/notification/data/model/notification_model.dart';
import 'package:naroutoshop/features/customers/notification/presentation/controller/notifcaiton_controller.dart';
import 'package:naroutoshop/features/customers/notification/presentation/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: StreamBuilder<List<NotificationModel>>(
        stream: NotificationController().getNotificationList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notification_add,
                    color: context.color.textColor,
                    size: 150,
                  ),
                  TextApp(
                    text: 'You Not Has Notifications Now',
                    theme: context.textStyle.copyWith(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return NotificationItem(
                body: snapshot.data![index].body,
                title: snapshot.data![index].title,
                isSeen: snapshot.data![index].isSeen,
                createdAt: snapshot.data![index].createdAt,
                onTapSelected: () async {
                  await FirebaseFirestore.instance
                      .collection(userCollection)
                      .doc(SharedPref().getInt(PrefKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .update({'isSeen': true});

                  if (snapshot.data![index].productId != -1) {
                    if (!context.mounted) return;
                    await context.pushNamed(
                      Routes.productDetails,
                      arguments: snapshot.data![index].productId,
                    );
                  }
                },
                onTapRemoved: () async {
                  await FirebaseFirestore.instance
                      .collection(userCollection)
                      .doc(SharedPref().getInt(PrefKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .delete();
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
          );
        },
      ),
    );
  }
}
