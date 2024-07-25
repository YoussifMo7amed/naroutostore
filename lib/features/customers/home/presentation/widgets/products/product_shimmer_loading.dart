import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';

class ProductShimmerLoading extends StatelessWidget {
  const ProductShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        itemBuilder: (context, index) {
          return LoadingShimmer(
            height: 250.h,
            width: 165.w,
          );
        },
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            // ignore: lines_longer_than_80_chars
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 15,
          childAspectRatio: 165 / 250,
        ),
      ),
    );
  }
}
