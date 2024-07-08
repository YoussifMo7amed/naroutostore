import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';

class CategoryLoadingShimmer extends StatelessWidget {
  const CategoryLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
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
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 15.w,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
