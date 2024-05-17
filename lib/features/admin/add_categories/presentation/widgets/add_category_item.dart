import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_admin.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/update/update_category_bottom_sheet_widget.dart';

class AddCategoryItems extends StatelessWidget {
  const AddCategoryItems({
    required this.name,
    required this.image,
    required this.categoryId,
    super.key,
  });
  final String name;
  final String image;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: name,
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontweightHelper.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                  IconButton(
                      onPressed: () {
                       
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),),
                  IconButton(
                      onPressed: () {
                         CagegoryModalBottomSheet.showModalCategoryBottomSheet(
              context: context,
              widget:const UpdateCategoryBottomSheet(),);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 25,
                      ),),
                ],
                ),
                const Spacer(),
              ],
            ),
            Flexible(
              child: CachedNetworkImage(
                imageUrl: image,
                height: 90.h,
                width: 120.w,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
