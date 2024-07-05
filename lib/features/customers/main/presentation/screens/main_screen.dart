import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/enums/nav_bar_enum.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';
import 'package:naroutoshop/features/customers/categories/categories_screen.dart';
import 'package:naroutoshop/features/customers/favorites/favorites_screen.dart';
import 'package:naroutoshop/features/customers/home/home_screen.dart';
import 'package:naroutoshop/features/customers/main/presentation/bloc/nav_bar/nav_bar_cubit.dart';
import 'package:naroutoshop/features/customers/main/presentation/refactors/bottom_nav_bar.dart';
import 'package:naroutoshop/features/customers/main/presentation/refactors/main_customer_app_bar.dart';
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
                    if (cubit.navBar == NavBarEnum.categories) {
                      return const CategoriesScreen();
                    } else if (cubit.navBar == NavBarEnum.profile) {
                      return const ProfileScreen();
                    } else if (cubit.navBar == NavBarEnum.favorites) {
                      return const FavoritesScreen();
                    } else {
                      return const HomeScreen();
                    }
                  },
                ),
              ),
              const MainBottomNavBar(),
            ],
          ),
        ));
  }
}
