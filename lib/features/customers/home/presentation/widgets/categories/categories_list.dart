import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/categories/category_list_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Categories
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
          child: SizedBox(
            height: 125.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return const CategoryListItem(
                  image:
                      'https://images.unsplash.com/photo-1719843076878-437479063d53?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMHx8fGVufDB8fHx8fA%3D%3D',
                  title: 'Houseware',
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 15.w,
              ),
            ),
          ),
        )
      ],
    );
  }
}
