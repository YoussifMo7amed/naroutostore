import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/create/create_category_upload_image.dart';

class CreateCagegoryBottomSheet extends StatefulWidget {
  const CreateCagegoryBottomSheet({super.key});

  @override
  State<CreateCagegoryBottomSheet> createState() =>
      _CreateCagegoryBottomSheetState();
}

class _CreateCagegoryBottomSheetState extends State<CreateCagegoryBottomSheet> {
  final formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
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
                text: 'Create Category',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontweightHelper.bold,
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
                    fontWeight: FontweightHelper.medium,
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'Remove',
                  width: 120.w,
                  height: 35.h,
                  lastRadius: 10,
                  threeRadius: 10,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            verticalSpace(10.h),
            //upload image
            const CreateCategoryUploadImage(
              image:
                  'https://plus.unsplash.com/premium_photo-1669048776605-28ea2e52ae66?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8',
            ),
            verticalSpace(10.h),
            //category name
            TextApp(
              text: 'Enter the Category Name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontweightHelper.medium,
              ),
            ),
            verticalSpace(10.h),
            CustomTextField(
              controller: titleController,
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
            CustomButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  //submit
                }
              },
              text: 'Create a new Category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              lastRadius: 20,
              threeRadius: 20,
              backgroundColor: Colors.white,
              textColor: ColorsDark.blueDark,
            ),
            verticalSpace(10.h),
          ],
        ),
      ),
    );
  }
}
