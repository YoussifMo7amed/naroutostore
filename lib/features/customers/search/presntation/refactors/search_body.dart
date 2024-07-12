import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/customers/search/presntation/widgets/filter_bottoms.dart';
import 'package:naroutoshop/features/customers/search/presntation/widgets/search_for_data.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: const Column(
        children: [
          //filter bottoms
          FilterBottoms(),
         
        ],
      ),
    );
  }
}
