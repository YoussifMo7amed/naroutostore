import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/screens/under_build_screen.dart';
import 'package:naroutoshop/core/routes/base_routes.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/features/auth/presentation/refactors/sign_up_body.dart';
import 'package:naroutoshop/features/auth/presentation/screens/login_screen.dart';
import 'package:naroutoshop/features/auth/presentation/screens/sign_up_screen.dart';

class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return BaseRoute(page: const LoginScreen());
      case Routes.signUp:
        return BaseRoute(page: const SignUpScreen());

      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
