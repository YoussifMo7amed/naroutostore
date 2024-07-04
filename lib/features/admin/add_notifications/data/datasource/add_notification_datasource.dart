import 'package:naroutoshop/core/service/push_notifications/firebase_cloud_messaging.dart';

class AddNotificationDatasource {
  //Send Notification Topics To  Users
  Future<void> sendNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
  final responce =  await FirebaseCloudMessaging().sendTopicNotification(
      title: title,
      body: body,
      productId: productId,
    );
    return responce;
  }
}
