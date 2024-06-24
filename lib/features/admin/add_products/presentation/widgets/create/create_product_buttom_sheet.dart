import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/common/widgets/custom_drop_down.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/create/create_product_image.dart';

class CreateProductButtomSheet extends StatefulWidget {
  const CreateProductButtomSheet({super.key});

  @override
  State<CreateProductButtomSheet> createState() =>
      _CreateProductButtomSheetState();
}

class _CreateProductButtomSheetState extends State<CreateProductButtomSheet> {
  final formkey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? categoryName;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Center(
                child: TextApp(
                  text: 'Update Product',
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
                    text: 'Update a Photos',
                    theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ],
              ),

              verticalSpace(15.h),
              const CreateProductImage(),

              verticalSpace(15.h),

              TextApp(
                text: 'title',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),

              verticalSpace(15.h),
              CustomTextField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                hintText: 'title',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'title is required';
                  }
                  return null;
                },
              ),

              verticalSpace(15.h),

              TextApp(
                text: 'price',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),

              verticalSpace(15.h),

              CustomTextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                hintText: 'price',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'price is required';
                  }
                  return null;
                },
              ),

              verticalSpace(15.h),

              TextApp(
                text: 'description',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),

              verticalSpace(15.h),

              CustomTextField(
                controller: _descriptionController,
                hintText: 'description',
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'description is required';
                  }
                  return null;
                },
              ),
              verticalSpace(15.h),

              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),

              verticalSpace(15.h),
              CustomCreateDropDown(
                hintText: 'Select a Category',
                items: [],
                onChanged: (value) {
                  setState(() {
                    categoryName = value;
                  });
                },
                value: categoryName,
              ),
              verticalSpace(15.h),
              CustomButton(
                onPressed: () {},
                text: 'Add  Product',
                width: MediaQuery.sizeOf(context).width,
                height: 50.h,
                lastRadius: 20,
                threeRadius: 20,
                backgroundColor: Colors.white,
                textColor: ColorsDark.blueDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
