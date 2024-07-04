import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/get_all_notifications/get_all_notifications_bloc.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/refactors/add_notification_body.dart';

class AddNotificationsScreen extends StatelessWidget {
  const AddNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetAllNotificationsBloc>()
            ..add(
              const GetAllNotificationsEvent.getAllNotification(),
            ),
        ),
        BlocProvider(create: (context) => sl<AddNotificationBloc>()),
        BlocProvider(create: (context) => sl<SendNotificationBloc>()),
      ],
      child: Scaffold(
        appBar: AppBarAdmin(
          ismain: true,
          tittle: 'Notifications',
          backgroundColor: context.color.mainColor!,
        ),
        body: const AddNotificationsBody(),
      ),
    );
  }
}
