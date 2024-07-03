import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/service/hive/hive_database.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';

part 'add_notification_event.dart';
part 'add_notification_state.dart';
part 'add_notification_bloc.freezed.dart';

class AddNotificationBloc
    extends Bloc<AddNotificationEvent, AddNotificationState> {
  AddNotificationBloc() : super(const _Initial()) {
    on<CreateNotificationEvent>(_createNotification);
  }

  FutureOr<void> _createNotification(
    CreateNotificationEvent event,
    Emitter<AddNotificationState> emit,
  ) {
    try {
      emit(const AddNotificationState.loading());
      HiveDatabase().addNotificationBox!.add(event.addNotification);
      emit(const AddNotificationState.success());
    } catch (error) {
      emit(AddNotificationState.error(error: error.toString()));
    }
  }
}
