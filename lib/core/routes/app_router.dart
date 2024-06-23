import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/screens/under_build_screen.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/routes/base_routes.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/features/admin/home_admin/presentation/screens/home_admin_screen.dart';
import 'package:naroutoshop/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:naroutoshop/features/auth/presentation/screens/login_screen.dart';
import 'package:naroutoshop/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:naroutoshop/features/customers/home_customer.dart';

class AppRouter {
  static Route<void> generateroutes(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<AuthBloc>(),
              ),
            ],
            child: const SignUpScreen(),
          ),
        );
      case Routes.adminHome:
        return BaseRoute(page: const HomeAdmin());
      case Routes.customerHome:
        return BaseRoute(page: const HomeCustomer());

      default:
        return BaseRoute(page: const UnderBuildScreen());
    }
  }
}
