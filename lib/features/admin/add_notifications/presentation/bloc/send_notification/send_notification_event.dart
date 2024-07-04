part of 'send_notification_bloc.dart';

@freezed
class SendNotificationEvent with _$SendNotificationEvent {
  const factory SendNotificationEvent.started() = _Started;
  const factory SendNotificationEvent.sendNotification({
    required String title,
    required String body,
    required int productId,
    required int index,
  }) = _SendNewNotificationEvent;
}