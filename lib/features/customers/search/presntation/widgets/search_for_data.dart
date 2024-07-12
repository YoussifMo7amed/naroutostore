import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';

class SearchForData extends StatelessWidget {
  const SearchForData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.search,
          size: 150,
          color: context.color.textColor,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextApp(
          text: 'Search For Data',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ],
    );
  }
}
