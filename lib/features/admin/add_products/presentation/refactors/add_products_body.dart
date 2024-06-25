import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/loading/empty_page.dart';
import 'package:naroutoshop/core/loading/loading_shimmer.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/create/create_product.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/product_admin_list.dart';

class AddProductsBody extends StatelessWidget {
  const AddProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          const CreateProduct(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllProductsBloc>().add(
                      const FetchAllProductsAdminEvent(
                        isLoading: true,
                      ),
                    );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: verticalSpace(20.h),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return GridView.builder(
                              itemBuilder: (context, index) {
                                return LoadingShimmer(
                                  height: 220.h,
                                  width: 165.w,
                                );
                              },
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                childAspectRatio: 165 / 250,
                              ),
                            );
                          },
                          success: (productList) {
                            return GridView.builder(
                              itemBuilder: (context, index) {
                                return ProductAdminList(
                                  imageUrl: productList[index].images!.first,
                                  title: productList[index].title ?? '',
                                  categoryName:
                                      productList[index].category!.name ?? '',
                                  price: productList[index].price.toString() ??
                                      '0',
                                );
                              },
                              itemCount: productList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                childAspectRatio: 165 / 250,
                              ),
                            );
                          },
                          error: Text.new,
                          empty: EmptyPage.new,
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
