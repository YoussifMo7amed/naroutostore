import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/repo/add_notifications_repo.dart';

part 'send_notification_event.dart';
part 'send_notification_state.dart';
part 'send_notification_bloc.freezed.dart';

class SendNotificationBloc
    extends Bloc<SendNotificationEvent, SendNotificationState> {
  SendNotificationBloc( this._repo) : super(const _Initial()) {
    on<_SendNewNotificationEvent>(_sendNotification);
  }
  final AddNotificationsRepo _repo;
  FutureOr<void> _sendNotification(
    _SendNewNotificationEvent event,
    Emitter<SendNotificationState> emit,
  ) async {
    emit(const SendNotificationState.loading(index: 0));
    final result = await _repo.sendNotification(
      title: event.title,
      body: event.body,
      productId: event.productId,
    );
    result.when(
      success: (_) {
        emit(const SendNotificationState.success());
      },
      failure: (error) {
        emit(SendNotificationState.error(error: error));
      },
    );
  }
}
