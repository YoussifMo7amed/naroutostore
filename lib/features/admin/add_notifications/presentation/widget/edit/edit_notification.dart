import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/get_all_notifications/get_all_notifications_bloc.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/widget/edit/edit_notification_bottom_sheet_widget.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({required this.notificationModel, super.key});
  final AddNotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomModalBottomSheet.showModalCategoryBottomSheet(
          context: context,
          widget: EditNotificationButtomSheet(
            notificationModel: notificationModel,
          ),
          whencompleted: () {
            context.read<GetAllNotificationsBloc>().add(
                  const GetAllNotificationsEvent.getAllNotification(
                  
                  ),
                );
          },
        );
      },
      child: Icon(
        Icons.edit,
        color: Colors.yellow,
        size: 20.sp,
      ),
    );
  }
}
