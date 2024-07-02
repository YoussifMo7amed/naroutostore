import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/widget/edit/edit_notification_bottom_sheet_widget.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          CustomModalBottomSheet.showModalCategoryBottomSheet(
              context: context,
              widget: const EditNotificationButtomSheet(),
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
