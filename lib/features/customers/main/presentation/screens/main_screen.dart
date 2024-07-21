import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/enums/nav_bar_enum.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/customers/favorites/presentation/screen/favorites_screen.dart';
import 'package:naroutoshop/features/customers/home/presentation/screens/home_screen.dart';
import 'package:naroutoshop/features/customers/main/presentation/bloc/nav_bar/nav_bar_cubit.dart';
import 'package:naroutoshop/features/customers/main/presentation/refactors/bottom_nav_bar.dart';
import 'package:naroutoshop/features/customers/main/presentation/refactors/main_customer_app_bar.dart';
import 'package:naroutoshop/features/customers/notification/presentation/screens/notification_screen.dart';
import 'package:naroutoshop/features/customers/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainCustomerAppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(context.assets.homeBg!),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<NavBarCubit, NavBarState>(
                  builder: (context, state) {
                    final cubit = context.watch<NavBarCubit>();
                     if (cubit.navBar == NavBarEnum.notifications) {
                      return const NotificationScreen();
                    } else if (cubit.navBar == NavBarEnum.favorites) {
                      return const FavoritesScreen();
                    } else if (cubit.navBar == NavBarEnum.profile) {
                      return const ProfileScreen();
                    }
                    return const HomeScreen();
                  },
                ),
              ),
              const MainBottomNavBar(),
            ],
          ),
        ),);
  }
}
