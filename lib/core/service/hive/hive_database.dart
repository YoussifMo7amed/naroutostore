import 'package:hive_flutter/hive_flutter.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:naroutoshop/features/customers/favorites/data/models/favorites_model.dart';

class HiveDatabase {
  factory HiveDatabase() => instance;
  HiveDatabase._();
  static final HiveDatabase instance = HiveDatabase._();

  Box<AddNotificationModel>? addNotificationBox;
  Box<FavoritesModel>? favoritesBox;

  Future<void> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(AddNotificationModelAdapter())
      ..registerAdapter(FavoritesModelAdapter());
    addNotificationBox =
        await Hive.openBox<AddNotificationModel>('addNotificationBox');
    favoritesBox = await Hive.openBox<FavoritesModel>('favoritesBox');
  }

  Future<void> clearAllBox() async {
    await addNotificationBox!.clear();
    await favoritesBox!.clear();
  }
}
