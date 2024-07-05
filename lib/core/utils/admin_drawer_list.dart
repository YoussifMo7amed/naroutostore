import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/dialog/custom_dialogs.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/service/shared_pref/pref_keys.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/screens/add_categories_screen.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/screens/add_notifications_screen.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/screens/add_products_screen.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:naroutoshop/features/admin/users/presentation/screens/users_screen.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    DrawerItemModel(
      title: TextApp(
        text: 'Dashboard',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(
        Icons.dashboard,
        color: Colors.white,
      ),
      page: const DashboardScreen(),
    ),
    //add categories
    DrawerItemModel(
      title: TextApp(
        text: 'Categories',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(
        Icons.category_outlined,
        color: Colors.white,
      ),
      page: const AddCategoriesScreen(),
    ),
    DrawerItemModel(
      title: TextApp(
        text: 'products',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(
        Icons.production_quantity_limits,
        color: Colors.white,
      ),
      page: const AddProductsScreen(),
    ),
    DrawerItemModel(
      title: TextApp(
        text: 'Users',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(
        Icons.people_alt_rounded,
        color: Colors.white,
      ),
      page: const UsersScreen(),
    ),
    DrawerItemModel(
      title: TextApp(
        text: 'Notifications',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(
        Icons.notifications_active,
        color: Colors.white,
      ),
      page: const AddNotificationsScreen(),
    ),
    //LogOut
    DrawerItemModel(
      icon: const Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Do you want log out?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,
            onPressed: () async {
            
            },
          );
        },
        child: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeightHelper.bold,
            fontSize: 17,
          ),
        ),
      ),
      page: const UsersScreen(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.title,
    required this.icon,
    required this.page,
  });

  final Widget title;
  final Icon icon;
  final Widget page;
}
