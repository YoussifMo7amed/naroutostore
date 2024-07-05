import 'package:flutter/material.dart';
import 'package:naroutoshop/core/language/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  AppInfo._();
  static Future<String> getAppVersion(BuildContext context) async {
    var buildNumberText = '';

    final packageInfo = await PackageInfo.fromPlatform();
    if (AppLocalizations.of(context)!.isEnLocale) {
      buildNumberText =
          ' ${packageInfo.version} (${packageInfo.buildNumber})';
    } else {
      buildNumberText =
          ' (${packageInfo.buildNumber}) ${packageInfo.version}';
    }

    return buildNumberText;
  }
}
