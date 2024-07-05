import 'package:flutter/material.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/service/hive/hive_database.dart';
import 'package:naroutoshop/core/service/shared_pref/pref_keys.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';

class AppLogout {
  factory AppLogout() => AppLogout.instance;
  AppLogout._();
  static AppLogout instance = AppLogout._();

  Future<void> logout() async {
    final context = sl<GlobalKey<NavigatorState>>().currentState!.context;
    final navigator = Navigator.of(context);
    await SharedPref().removePreference(PrefKeys.accessToken);
    await SharedPref().removePreference(PrefKeys.userId);
    await SharedPref().removePreference(PrefKeys.userRole);
    await HiveDatabase.instance.clearAllBox();
    await navigator.pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }
}
