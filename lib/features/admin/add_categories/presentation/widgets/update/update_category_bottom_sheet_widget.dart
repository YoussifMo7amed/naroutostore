import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/update_category_request.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/update_category/update_category_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/update/update_category_upload_image.dart';

class UpdateCategoryBottomSheet extends StatefulWidget {
  const UpdateCategoryBottomSheet({
    required this.imageUrl,
    required this.name,
    required this.categoryId,
    super.key,
  });
  final String imageUrl;
  final String name;
  final String categoryId;

  @override
  State<UpdateCategoryBottomSheet> createState() =>
      _UpdateCategoryBottomSheetState();
}

class _UpdateCategoryBottomSheetState extends State<UpdateCategoryBottomSheet> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  @override
  void initState() {
    nameController.text = widget.name;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Center(
              child: TextApp(
                text: 'Update Category',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            verticalSpace(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Add a Photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ],
            ),
            verticalSpace(10.h),
            //upload image
            UpdateCategoryUploadImage(
              image: widget.imageUrl,
            ),
            verticalSpace(10.h),
            //category name
            TextApp(
              text: 'Enter the Category Name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            verticalSpace(10.h),
            CustomTextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              hintText: 'Category Name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Category name is required';
                }
                return null;
              },
            ),
            verticalSpace(10.h),
            BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();

                    ShowToast.showToastSuccessTop(
                      message: '${nameController.text} updated successfully',
                      seconds: 2,
                    );
                  },
                  error: (message) {
                    ShowToast.showToastErrorTop(
                      message: message,
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.8),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ColorsDark.blueDark,
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          _validUpdateCategory();
                        }
                      },
                      text: 'Update a new Category',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      lastRadius: 20,
                      threeRadius: 20,
                      backgroundColor: Colors.white,
                      textColor: ColorsDark.blueDark,
                    );
                  },
                );
              },
            ),
            verticalSpace(10.h),
          ],
        ),
      ),
    );
  }

  void _validUpdateCategory() {
    if (formkey.currentState!.validate()) {
      context.read<UpdateCategoryBloc>().add(
            UpdateCategoryEvent.updateCategoryEvent(
              body: UpdateCategoryRequestBody(
                name: nameController.text.trim(),
                image: context.read<UploadImageCubit>().getImageUrl.isEmpty
                    ? widget.imageUrl
                    : context.read<UploadImageCubit>().getImageUrl,
                id: widget.categoryId,
              ),
            ),
          );
    }
  }
}
