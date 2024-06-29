import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/common/widgets/custom_drop_down.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/update_product_request_body.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/update/update_product_image.dart';

class UpdateProductButtomSheet extends StatefulWidget {
  const UpdateProductButtomSheet({
    required this.imageList,
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.productId,
    required this.categoryName,
    super.key,
  });
  final List<String> imageList;
  final String title;
  final String price;
  final String description;
  final String categoryId;
  final String categoryName;
  final String productId;

  @override
  State<UpdateProductButtomSheet> createState() =>
      _UpdateProductButtomSheetState();
}

class _UpdateProductButtomSheetState extends State<UpdateProductButtomSheet> {
  final formkey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? categoryValueName;
  double? categoryValueId;
  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _priceController.text = widget.price;
    _descriptionController.text = widget.description;
    categoryValueName = widget.categoryName;
    categoryValueId = double.parse(widget.categoryId);
  }

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
              UpdateProductImage(
                imageList: widget.imageList,
              ),

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
              BlocBuilder<GetAllCategoriesAdminBloc,
                  GetAllCategoriesAdminState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (category) {
                      return CustomCreateDropDown(
                        hintText: '',
                        items: category.getCategoryDropDownList,
                        onChanged: (value) {
                          setState(() {
                            categoryValueName = value;
                            final categoryStringId = category
                                .categoriesGetAllList
                                .firstWhere((e) => e.name == value)
                                .id!;
                            categoryValueId = double.parse(categoryStringId);
                          });
                        },
                        value: categoryValueName,
                      );
                    },
                    orElse: () {
                      return CustomCreateDropDown(
                        hintText: '',
                        items: const [],
                        onChanged: (value) {},
                        value: '',
                      );
                    },
                  );
                },
              ),
              verticalSpace(15.h),
              BlocConsumer<UpdateProductBloc, UpdateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      context.pop();

                      ShowToast.showToastSuccessTop(
                        message:
                            '${_titleController.text} Updated successfully',
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
                        width: MediaQuery.sizeOf(context).width,
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
                          _validateUpdateProduct(context);
                        },
                        text: 'Update  Product',
                        width: MediaQuery.sizeOf(context).width,
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
            ],
          ),
        ),
      ),
    );
  }

  void _validateUpdateProduct(BuildContext context) {
    if (formkey.currentState!.validate()) {
      String urlsString = widget.imageList[0];

      // Remove the brackets
      urlsString = urlsString.replaceAll('[', '').replaceAll(']', '');

      // Split the string into a list of URLs
      List<String> imageList =
          urlsString.split(', ').map((url) => url.replaceAll('"', '')).toList();

      context.read<UpdateProductBloc>().add(
            UpdateProductEvent.updateProduct(
              body: UpdateProductRequestBody(
                title: _titleController.text.trim(),
                price: double.parse(_priceController.text.trim()),
                description: _descriptionController.text.trim(),
                categoryId: categoryValueId ?? 0,
                productId: widget.productId,
                imageList:
                    context.read<UploadImageCubit>().updateimageList.isEmpty
                        ? imageList
                        : context.read<UploadImageCubit>().updateimageList,
              ),
            ),
          );
    }
  }
}
