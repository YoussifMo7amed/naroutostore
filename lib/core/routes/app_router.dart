import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/screens/under_build_screen.dart';

class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => const PageUnderBuildScreen(),
        );
    }
  }
}
