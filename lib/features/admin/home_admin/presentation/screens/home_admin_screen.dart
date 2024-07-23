import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';
import 'package:naroutoshop/core/utils/admin_drawer_list.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/screens/dashboard_screen.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  Widget page = const DashboardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScreen(
            onPageChange: (p) {
              setState(() {
                page = p;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: context.color.mainColor!.withOpacity(0.6),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({required this.onPageChange, super.key});
  final void Function(Widget) onPageChange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: const AppBarAdmin(
        backgroundColor: ColorsDark.blueDark,
        ismain: false,
        tittle: 'Naruto Store',
      ),
      body: Column(
        children: [
          Column(
            children: adminDrawerList(context).map((e) {
              return ListTile(
                onTap: () {
                  onPageChange(e.page);
                },
                title: e.title,
                leading: e.icon,
              );
            }).toList(),
          ),
          Image.asset(AppImages.drawerImage),
      
        ],
      ),
    );
  }
}
