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
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/create_product_request_body.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/create_product/create_product_bloc.dart';
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
  double? categoryId;

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
                  text: 'Add Product',
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
                    text: 'Add  Photos',
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
              BlocBuilder<GetAllCategoriesAdminBloc,
                  GetAllCategoriesAdminState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (data) {
                      return CustomCreateDropDown(
                        hintText: 'Select a Category',
                        items: data.getCategoryDropDownList,
                        onChanged: (value) {
                          setState(() {
                            categoryName = value;
                            final categoryStringId = data.categoriesGetAllList
                                .firstWhere((e) => e.name == value)
                                .id!;
                            categoryId = double.parse(categoryStringId);
                          });
                        },
                        value: categoryName,
                      );
                    },
                    orElse: () {
                      return CustomCreateDropDown(
                        hintText: 'Select a Category',
                        items: const [],
                        onChanged: (value) {},
                        value: categoryName,
                      );
                    },
                  );
                },
              ),
              verticalSpace(15.h),
              BlocConsumer<CreateProductBloc, CreateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      context.pop();

                      ShowToast.showToastSuccessTop(
                        message:
                            '${_titleController.text} created successfully',
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
                          _validaeandcreate(context);
                        },
                        text: 'Add  Product',
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

  Future<void> _validaeandcreate(BuildContext context) async {
    final indexEmptyImage =
        context.read<UploadImageCubit>().imageList.indexWhere(
              (e) => e.isNotEmpty,
            );

    if (formkey.currentState!.validate() ||
        indexEmptyImage == -1 ||
        categoryName != null) {
      if (indexEmptyImage == -1) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      } else if (categoryName == null) {
        ShowToast.showToastErrorTop(
          message: 'please select a category',
        );
      } else {
        final filteredList = context
            .read<UploadImageCubit>()
            .imageList
            .where((item) => item.isNotEmpty)
            .toList();
        context.read<CreateProductBloc>().add(
              CreateProductEvent.createProduct(
                body: CreateProdutRequestBody(
                  title: _titleController.text.trim(),
                  price: double.parse(_priceController.text.trim()),
                  description: _descriptionController.text,
                  images: filteredList,
                  categoryId: categoryId ?? 0,
                ),
              ),
            );
      }
    }
  }
}
