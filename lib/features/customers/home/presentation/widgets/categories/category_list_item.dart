import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_customer.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({required this.image, required this.title, super.key});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainerLinearCustomer(
          height: 71.h,
          width: 71.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              placeholder: (context, url) => const SizedBox.shrink(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeightHelper.bold,
            fontFamily: FontFamilyHelper.poppinsEnglish,
          ),
        ),
      ],
    );
  }
}
