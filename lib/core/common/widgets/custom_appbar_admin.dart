import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class AppBarAdmin extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAdmin({
    required this.ismain,
    required this.tittle,
    required this.backgroundColor,
    super.key,
  });
  final bool ismain;
  final String tittle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: TextApp(
        text: tittle,
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 18.sp,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      leading: ismain
          ? IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
