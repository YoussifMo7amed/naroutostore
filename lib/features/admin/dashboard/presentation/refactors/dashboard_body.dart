import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:naroutoshop/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: RefreshIndicator(
          onRefresh: () async {
            context
                .read<ProductsNumberBloc>()
                .add(const ProductsNumberEvent.getProductsNumber());
            context
                .read<CategoriesNumberBloc>()
                .add(const CategoriesNumberEvent.getCategoriesNumber());
            context
                .read<UsersNumberBloc>()
                .add(const UsersNumberEvent.getUsersNumber());
          },
          child: ListView(
            children: [
              BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
                builder: (context, state) {
                  return state.when(
                    loading: () {
                    return const DashBoardContainer(
                      title: 'Products',
                      number: '0',
                      image: AppImages.productsDrawer,
                      isloading: true,
                    );
                  }, success: (productData) {
                    return  DashBoardContainer(
                      title: 'Products',
                      number:productData ,
                      image: AppImages.productsDrawer,
                      isloading: false,
                    );
                  }, error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(color: Colors.red),
                    );
                  },);
                },
              ),
              verticalSpace(20.h),
               BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
                builder: (context, state) {
                  return state.when(
                    loading: () {
                    return const DashBoardContainer(
                      title: 'Categories',
                      number: '0',
                      image: AppImages.categoriesDrawer,
                      isloading: true,
                    );
                  }, success: (categoryData) {
                    return  DashBoardContainer(
                      title: 'Categories',
                      number:categoryData ,
                      image: AppImages.categoriesDrawer,
                      isloading: false,
                    );
                  }, error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(color: Colors.red),
                    );
                  },);
                },
              ),
              verticalSpace(20.h),
               BlocBuilder<UsersNumberBloc, UsersNumberState>(
                builder: (context, state) {
                  return state.when(
                    loading: () {
                    return const DashBoardContainer(
                      title: 'Users',
                      number: '0',
                      image: AppImages.usersDrawer,
                      isloading: true,
                    );
                  }, success: (usersData) {
                    return  DashBoardContainer(
                      title: 'Users',
                      number:usersData ,
                      image: AppImages.usersDrawer,
                      isloading: false,
                    );
                  }, error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(color: Colors.red),
                    );
                  },);
                },
              ),
            ],
          ),),
    );
  }
}
