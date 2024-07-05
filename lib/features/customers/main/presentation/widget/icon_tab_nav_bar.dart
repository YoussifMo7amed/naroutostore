import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class IcanTabNavBar extends StatelessWidget {
  const IcanTabNavBar(
      {required this.onTap,
      required this.image,
      required this.isSelected,
      super.key,
       });
  final VoidCallback onTap;
  final String image;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        image,
        color: isSelected ? context.color.navBarSelectedTab : Colors.grey,
        height: 25.h,
      ),
    ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2);
  }
}
