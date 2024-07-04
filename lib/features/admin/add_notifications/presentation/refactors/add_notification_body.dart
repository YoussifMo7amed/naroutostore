import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/loading/empty_page.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/get_all_notifications/get_all_notifications_bloc.dart';
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
                  child: BlocBuilder<GetAllNotificationsBloc,
                      GetAllNotificationsState>(
                    builder: (context, state) {
                      return state.when(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                          success: (notificationsList) {
                            return ListView.separated(
                              itemCount: notificationsList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return AddNotificationItem(
                                  notificationModel: notificationsList[index],
                                  index: index,
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: 15.h,
                              ),
                            );
                          },
                          empty: EmptyPage.new,
                          error: Text.new);
                    },
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
