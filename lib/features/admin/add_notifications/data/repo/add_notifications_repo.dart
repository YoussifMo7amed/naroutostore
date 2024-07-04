import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/datasource/add_notification_datasource.dart';

class AddNotificationsRepo {
  AddNotificationsRepo(this._dataSource);

  final AddNotificationDatasource _dataSource;
  //Send Notification Topics To  Users
  Future<ApiResult<void>> sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final responce = await _dataSource.sendNotification(
        title: title,
        body: body,
        productId: productId,
      );
      return ApiResult.success(responce);
    } catch (error) {
      return const ApiResult.failure(
        'Something went wrong, please try again later',
      );
    }
  }
}
