import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';

class CategoryLoadingShimmer extends StatelessWidget {
  const CategoryLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingShimmer(
          height: 71.h,
          width: 71.w,
          borderRadius: 15.r,
        ),
        SizedBox(
          height: 10.h,
        ),
        LoadingShimmer(
          height: 20.h,
          width: 100.w,
          borderRadius: 15.r,
        ),
      ],
    );
  }
}
