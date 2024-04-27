import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/utils/image_pick.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: InkWell(
        onTap: () {
          PickImageUtils().pickImage();
        },
        child: CircleAvatar(
          radius: 38.r,
          backgroundImage: const NetworkImage(
              'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg'),
        ),
      ),
    );
  }
}
