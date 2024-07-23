import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';

class SendNotifications extends StatelessWidget {
  const SendNotifications({
    required this.index,
    required this.notificationModel,
    super.key,
  });
  final AddNotificationModel notificationModel;

  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationBloc, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: 'Notification Send successfully',
              seconds: 2,
            );
          },
          error: (message) {
            ShowToast.showToastErrorTop(
              message: message,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (indexId) {
            if (index == indexId) {
              return Row(
                children: [
                  SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 30.w),
                ],
              );
            } else {
              return IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Colors.green,
                  size: 20.sp,
                ),
              );
            }
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<SendNotificationBloc>().add(
                      SendNotificationEvent.sendNotification(
                        title: notificationModel.title,
                        body: notificationModel.body,
                        productId: notificationModel.productId,
                        index: index,
                      ),
                    );
              },
              icon: Icon(
                Icons.send,
                color: Colors.green,
                size: 20.sp,
              ),
            );
          },
        );
      },
    );
  }
}
