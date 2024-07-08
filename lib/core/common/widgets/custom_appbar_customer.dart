import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:naroutoshop/core/common/widgets/custom_linear_button.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';

class AppBarCustomer extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustomer({
    required this.tittle,
    super.key,
  });
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.color.mainColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomLinearButton(
            onPressed: () {
              context.pop();
            },
            child: SvgPicture.asset(AppImages.backButton),
          ),
          Flexible(
            child: TextApp(
              text: tittle,
              theme: context.textStyle.copyWith(
                color: context.color.textColor,
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          const Text('')
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
