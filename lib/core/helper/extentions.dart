import 'package:flutter/material.dart';
import 'package:naroutoshop/core/language/app_localizations.dart';
import 'package:naroutoshop/core/theme/color_extension.dart';
import 'package:naroutoshop/core/theme/image_extension.dart';

extension Navigation on BuildContext {

MyColors get color => Theme.of(this).extension<MyColors>()!;

MyImages get assets => Theme.of(this).extension<MyImages>()!;
String translate(String key) => AppLocalizations.of(this)!.translate(key).toString();

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
