import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/users/presentation/widgets/table_cell_title_widget.dart';

class TableForUsers extends StatelessWidget {
  const TableForUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsDark.blueLight),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(110.w),
      },
      children: [
         const TableRow(
          decoration: BoxDecoration(
            color: ColorsDark.blueDark,
          ),
          children: [
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: TableCellTitle(
                  tittle: 'Name',
                  icon: Icons.person,
                ),),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: TableCellTitle(
                  tittle: 'Email',
                  icon: Icons.email_outlined,
                ),),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: TableCellTitle(
                  tittle: 'Delete',
                  icon: Icons.delete_forever,
                ),),
          ],
        ),
        ...List.generate(
          20,
          (index) => TableRow(children: [
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: TextApp(
                      text: 'Name',
                      theme: context.textStyle.copyWith(
                        fontSize: 12.sp,
                        fontFamily: FontFamilyHelper.poppinsEnglish,
                        fontWeight: FontWeightHelper.medium,
                      ),),
                ),),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: TextApp(
                      text: 'YouseefMohamed2@Gmail.com',
                      theme: context.textStyle.copyWith(
                        fontSize: 12.sp,
                        fontFamily: FontFamilyHelper.poppinsEnglish,
                        fontWeight: FontWeightHelper.medium,
                      ),),
                ),),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),),
                ),),
          ],),
        ),
      ],
    );
  }
}
