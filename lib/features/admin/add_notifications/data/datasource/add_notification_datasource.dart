import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/core/service/push_notifications/firebase_cloud_messaging.dart';
import 'package:naroutoshop/core/utils/app_strings.dart';
import 'package:naroutoshop/core/utils/app_values.dart';
import 'package:naroutoshop/features/customers/notification/data/model/notification_model.dart';

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
  // add Notifications to all users in firebase data base

  Future<void> addNotificationsToAllUsersFirebase({
    required String body,
    required String title,
    required int productId,
  }) async {
    final notificationId = AppValues.randomStringId;
    const createAt = '';

    final users = FirebaseFirestore.instance.collection(userCollection);

    final usersGet = await users.get();

    for (final doc in usersGet.docs) {
      await users
          .doc(doc.id)
          .collection(notificationCollection)
          .doc(notificationId)
          .set(
            NotificationModel(
              body: body,
              title: title,
              productId: productId,
              isSeen: false,
              createdAt: createAt.convertDataFormate(),
              notificationId: notificationId,
            ).toJson(),
          );
    }
  }
}
