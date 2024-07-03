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
import 'package:naroutoshop/features/admin/add_notifications/data/models/add_notification_model.dart';

class EditNotificationButtomSheet extends StatefulWidget {
  const EditNotificationButtomSheet(
      {required this.notificationModel, super.key});
  final AddNotificationModel notificationModel;

  @override
  State<EditNotificationButtomSheet> createState() =>
      _EditNotificationButtomSheetState();
}

class _EditNotificationButtomSheetState
    extends State<EditNotificationButtomSheet> {
  final formkey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _productIdController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.notificationModel.title;
    _bodyController.text = widget.notificationModel.body;
    _productIdController.text = widget.notificationModel.productId.toString();
  }

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
                text: 'Edit Notifications',
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
              text: 'Edit Notification title',
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
              text: 'Edit The Notification body',
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
              text: 'Edit The  ProductId',
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
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'productId is required';
                }
                return null;
              },
            ),
            verticalSpace(20.h),
            CustomButton(
              onPressed: () {
                _validaeandcreate(context);
              },
              text: 'Edit  Notification',
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
    );
  }

  Future<void> _validaeandcreate(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      widget.notificationModel.title = _titleController.text.isEmpty
          ? widget.notificationModel.title
          : _titleController.text.trim();
      widget.notificationModel.body = _bodyController.text.isEmpty
          ? widget.notificationModel.body
          : _bodyController.text.trim();
      widget.notificationModel.productId = _productIdController.text.isEmpty
          ? widget.notificationModel.productId
          : int.parse(_productIdController.text.trim());
      await widget.notificationModel.save();

      // ignore: use_build_context_synchronously
      context.pop();
    }
  }
}
