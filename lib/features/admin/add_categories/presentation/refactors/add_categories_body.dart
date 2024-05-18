import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/loading/empty_page.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/widgets/create/create_category.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          //create category button
          SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: const CreateCategory()),

          //add category items
          Expanded(
            child: RefreshIndicator(
              color: ColorsDark.blueLight,
              onRefresh: () async {
                context.read<GetAllCategoriesAdminBloc>()
                  .add(const GetAllCategoriesAdminEvent.fetchAdminCategories());
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: verticalSpace(20.h),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllCategoriesAdminBloc,
                        GetAllCategoriesAdminState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return LoadingShimmer(
                              height: 130.h,
                              borderRadius: 15,
                            );
                          },
                          success: (list) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return AddCategoryItems(
                                  name: list.data.categoriesList[index].name ??
                                      '',
                                  image:
                                      list.data.categoriesList[index].image ??
                                          '',
                                  categoryId:
                                      list.data.categoriesList[index].id ?? '',
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  verticalSpace(15.h),
                              itemCount: list.data.categoriesList.length,
                            );
                          },
                          empty: EmptyPage.new,
                          error: Text.new,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
