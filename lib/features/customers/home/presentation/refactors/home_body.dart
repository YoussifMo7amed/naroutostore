import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';
import 'package:naroutoshop/features/customers/home/presentation/bloc/get_banners/get_banners_bloc.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/banners/banner_slider.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/categories/categories_list.dart';

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
          const SliverToBoxAdapter(
            child: CategoriesList(),
          ),
        ],
      ),
    );
  }
}
