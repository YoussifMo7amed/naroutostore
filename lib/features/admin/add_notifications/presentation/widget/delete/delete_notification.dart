import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/get_all_notifications/get_all_notifications_bloc.dart';

class DeleteNotification extends StatelessWidget {
  const DeleteNotification({required this.notificationModel, super.key});
  final AddNotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationBloc, AddNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context
                .read<GetAllNotificationsBloc>()
                .add(const GetAllNotificationsEvent.getAllNotification());
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return SizedBox(
              height: 15.h,
              width: 15.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<AddNotificationBloc>().add(
                      AddNotificationEvent.deleteNotification(
                        addNotification: notificationModel,
                      ),
                    );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 20.sp,
              ),
            );
          },
        );
      },
    );
  }
}
