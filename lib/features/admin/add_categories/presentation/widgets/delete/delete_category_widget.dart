import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/delete_category/delete_category_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';


class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({
    required this.categoryId,
    super.key,
  });
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryBloc, DeleteCategoryState>(
      listener: (context, state) {
       state.whenOrNull(
         success: () {
           context.read<GetAllCategoriesAdminBloc>().add(
                 const GetAllCategoriesAdminEvent.fetchAdminCategories(
                   isNotLoading: false,
                 ),
               );
           ShowToast.showToastSuccessTop(
             message: ' Category Deleted successfully',
           );
         },
         error: (error) {
           ShowToast.showToastErrorTop(
             message: '$error====>here',
           );
         },
       );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == categoryId) {
              return SizedBox(
              height: 15.h,
              width: 15.w,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
              
            );
            }else{
               return const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              );
            }
            
          },
          orElse: () {
            return InkWell(
              onTap: () {
                if (kDebugMode) {
                  print('Hiii>>>>>>>>>>>>>>>>>>=');
                }
                  context.read<DeleteCategoryBloc>().add(
              DeleteCategoryEvent.deleteCategory(
                categoryId: categoryId,
              ),
            );
              },
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            );
          },
        );
      },
    );
  }
}
