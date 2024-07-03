import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:naroutoshop/features/admin/add_notifications/presentation/widget/create/create_notification_bottom_sheet_widget.dart';

class CreateNotification extends StatelessWidget {
  const CreateNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Notifications',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        CustomButton(
          onPressed: () {
            // show buttonsheet
            CustomModalBottomSheet.showModalCategoryBottomSheet(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<AddNotificationBloc>(),
                  ),
                ],
                child: const CreateNotificationButtomSheet(),),
            );
          },
          text: 'Add',
          width: 90.w,
          height: 35.h,
          lastRadius: 10,
          threeRadius: 10,
          backgroundColor: ColorsDark.blueDark,
        ),
      ],
    );
  }
}
