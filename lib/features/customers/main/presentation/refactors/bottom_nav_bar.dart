import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/enums/nav_bar_enum.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';
import 'package:naroutoshop/features/customers/main/presentation/bloc/nav_bar/nav_bar_cubit.dart';
import 'package:naroutoshop/features/customers/main/presentation/widget/icon_tab_nav_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 103.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 88.h,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 45.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: BlocBuilder<NavBarCubit, NavBarState>(
                            builder: (context, state) {
                              final cubit = context.watch<NavBarCubit>();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IcanTabNavBar(
                                    image: AppImages.homeTab,
                                    isSelected: cubit.navBar == NavBarEnum.home,
                                    onTap: () {
                                      cubit.navBarChange(NavBarEnum.home);
                                    },
                                  ),
                                  IcanTabNavBar(
                                    image: AppImages.categoriesTab,
                                    isSelected:  cubit.navBar == NavBarEnum.categories,
                                    onTap: () {
                                      cubit.navBarChange(NavBarEnum.categories);
                                    },
                                  ),
                                  IcanTabNavBar(
                                    image: AppImages.favouritesTab,
                                    isSelected:cubit.navBar == NavBarEnum.favorites,
                                    onTap: () {
                                      cubit.navBarChange(NavBarEnum.favorites);
                                    },
                                  ),
                                  IcanTabNavBar(
                                    image: AppImages.profileTab,
                                    isSelected: cubit.navBar == NavBarEnum.profile,
                                    onTap: () {
                                      cubit.navBarChange(NavBarEnum.profile);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -12,
                left: -8,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.assets.bigNavBar!),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 17,
                left: 35,
                child: SvgPicture.asset(
                  AppImages.carShop,
                  color: Colors.white,
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
