import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/refactors/add_notification_body.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBarAdmin(
        ismain: true,
        tittle: 'Notifications',
        backgroundColor: context.color.mainColor!,
      ),
      body:const AddNotificationsBody(),
    );
  }
}
