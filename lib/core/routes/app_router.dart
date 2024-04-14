import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/screens/under_build_screen.dart';
import 'package:naroutoshop/core/routes/base_routes.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/test_one.dart';

class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.test1:
        return BaseRoute(page: const TestOne());
      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
