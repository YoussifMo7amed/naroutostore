import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/common/widgets/custom_text_field.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';

class CreateNotificationButtomSheet extends StatefulWidget {
  const CreateNotificationButtomSheet({super.key});

  @override
  State<CreateNotificationButtomSheet> createState() =>
      _CreateNotificationButtomSheetState();
}

class _CreateNotificationButtomSheetState
    extends State<CreateNotificationButtomSheet> {
  final formkey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _productIdController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _productIdController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Center(
              child: TextApp(
                text: 'Add Notifications',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            verticalSpace(20.h),
            //Enter Notification title
            TextApp(
              text: 'Enter Notification title',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),

            verticalSpace(20.h),
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

            verticalSpace(20.h),

            TextApp(
              text: 'Enter The Notification body',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),

            verticalSpace(20.h),

            CustomTextField(
              controller: _bodyController,
              keyboardType: TextInputType.text,
              hintText: 'Body',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Body is required';
                }
                return null;
              },
            ),

            verticalSpace(20.h),

            TextApp(
              text: 'Enter The  ProductId',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),

            verticalSpace(20.h),

            CustomTextField(
              controller: _productIdController,
              hintText: 'productId',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'productId is required';
                }
                return null;
              },
            ),
            verticalSpace(20.h),
            BlocConsumer<AddNotificationBloc, AddNotificationState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();

                    ShowToast.showToastSuccessTop(
                      message: 'Notification created successfully',
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
                        color: Colors.white,
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
                      text: 'Add  Notification',
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
    );
  }

  Future<void> _validaeandcreate(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      context.read<AddNotificationBloc>().add(
            CreateNotificationEvent(
              addNotification: AddNotificationModel(
                title: _titleController.text.trim(),
                body: _bodyController.text.trim(),
                productId: int.parse(_productIdController.text.trim()),
                createdAt: DateTime.now(),
              ),
            ),
          );
    }
  }
}
