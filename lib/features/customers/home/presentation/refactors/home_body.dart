import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/loading/empty_page.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/features/customers/home/presentation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:naroutoshop/features/customers/home/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:naroutoshop/features/customers/home/presentation/bloc/get_banners/get_banners_bloc.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/banners/banner_slider.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/categories/categories_list.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/categories/category_loading_shimmer.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/products/product_list.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/products/product_shimmer_loading.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.controller, super.key});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        controller: controller,
        slivers: [
          //Banners
          SliverToBoxAdapter(
            child: BlocBuilder<GetBannersBloc, GetBannersState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LoadingShimmer(
                        height: 160.h,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: 45.r,
                      ),
                    );
                  },
                  success: (imageBannerList) {
                    return BunnerSlider(
                      imageList: imageBannerList,
                    );
                  },
                  empty: () {
                    return const SizedBox.shrink();
                  },
                  error: Text.new,
                );
              },
            ),
          ),
          //Categories
          SliverToBoxAdapter(
            child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const CategoryLoadingShimmer();
                  },
                  success: (categoriesList) {
                    return CategoriesList(
                      categoryList: categoriesList,
                    );
                  },
                  empty: () {
                    return const EmptyPage();
                  },
                  error: Text.new,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const ProductShimmerLoading();
                  },
                  success: (productList) {
                    return ProductList(
                      productList: productList,
                    );
                  },
                  empty: () {
                    return const SizedBox.shrink();
                  },
                  error: Text.new,
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
                builder: (context, state) {
                  if (context.read<GetAllProductsBloc>().listIsLessThan10) {
                    return CustomButton(
                      onPressed: () {},
                      text: context.translate(LangKeys.viewAll),
                      width: MediaQuery.sizeOf(context).width,
                      height: 50.h,
                      lastRadius: 20,
                      threeRadius: 20,
                      backgroundColor: ColorsDark.blueLight,
                      textColor: Colors.white,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
