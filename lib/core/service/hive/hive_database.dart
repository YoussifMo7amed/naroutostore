import 'package:hive_flutter/hive_flutter.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';

class HiveDatabase {
  factory HiveDatabase() => instance;
  HiveDatabase._();
  static final HiveDatabase instance = HiveDatabase._();

  Box<AddNotificationModel>? addNotificationBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AddNotificationModelAdapter());
    addNotificationBox =
        await Hive.openBox<AddNotificationModel>('addNotificationBox');
  }

  Future<void> clearAllBox() async {
    await addNotificationBox!.clear();
  }
}
