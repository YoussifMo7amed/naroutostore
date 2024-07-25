import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_admin.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/update_category/update_category_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/delete/delete_category_widget.dart';
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
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    DeleteCategoryWidget(
                      categoryId: categoryId,
                    ),
                    IconButton(
                      onPressed: () {
                        _updateCategoryBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                        size: 25,
                      ),
                    ),
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

  void _updateCategoryBottomSheet(BuildContext context) {
    CustomModalBottomSheet.showModalCategoryBottomSheet(
      context: context,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<UpdateCategoryBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<UploadImageCubit>(),
          ),
        ],
        child: UpdateCategoryBottomSheet(
          categoryId: categoryId,
          name: name,
          imageUrl: image,
        ),
      ),
      whencompleted: () {
        context.read<GetAllCategoriesAdminBloc>().add(
              const GetAllCategoriesAdminEvent.fetchAdminCategories(
                isNotLoading: false,
              ),
            );
      },
    );
  }
}
