import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/service/hive/hive_database.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';
part 'get_all_notifications_event.dart';
part 'get_all_notifications_state.dart';
part 'get_all_notifications_bloc.freezed.dart';

class GetAllNotificationsBloc
    extends Bloc<GetAllNotificationsEvent, GetAllNotificationsState> {
  GetAllNotificationsBloc() : super(const GetAllNotificationsState.loading()) {
    on<FetchAllNotificationsEvent>(_getAllNotifications);
  }

  FutureOr<void> _getAllNotifications(
    FetchAllNotificationsEvent event,
    Emitter<GetAllNotificationsState> emit,
  ) async {
    try {
      if (event.isLoading) {
        emit(const GetAllNotificationsState.loading());
      }
      final notificationsList =
          HiveDatabase().addNotificationBox!.values.toList();
      if (notificationsList.isEmpty) {
        emit(const GetAllNotificationsState.empty());
      } else {
        emit(
          GetAllNotificationsState.success(notifications: notificationsList),
        );
      }
    } catch (error) {
      emit(GetAllNotificationsState.error(error: error.toString()));
    }
  }
}
