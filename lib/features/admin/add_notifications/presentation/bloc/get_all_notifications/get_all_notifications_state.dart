part of 'get_all_notifications_bloc.dart';

@freezed
class GetAllNotificationsState with _$GetAllNotificationsState {
  const factory GetAllNotificationsState.loading() = _LoadingState;
  const factory GetAllNotificationsState.success(
      {required List<AddNotificationModel> notifications}) = _SuccessState;
      const factory GetAllNotificationsState.empty() = _EmptyState;
  const factory GetAllNotificationsState.error({required String error}) =
      _ErrorState;
}
