part of 'get_all_notifications_bloc.dart';

@freezed
class GetAllNotificationsEvent with _$GetAllNotificationsEvent {
  const factory GetAllNotificationsEvent.started() = _Started;

  const factory GetAllNotificationsEvent.getAllNotification() = FetchAllNotificationsEvent;
}