import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/categories/category_list_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({required this.categoryList, super.key});
  final List<GetAllCategoriesModel> categoryList;
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
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return  CategoryListItem(
                  image:
                      categoryList[index].image??'',
                  title: categoryList[index].name??'' ,
                  id: int.parse(categoryList[index].id??'0'),
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
