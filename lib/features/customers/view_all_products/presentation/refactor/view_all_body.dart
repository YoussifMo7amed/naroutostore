import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_product_item.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/features/customers/view_all_products/presentation/bloc/view_all_products/view_all_products_bloc.dart';
import 'package:naroutoshop/features/customers/view_all_products/presentation/bloc/view_all_products/view_all_products_state.dart';

class ViewAllBody extends StatefulWidget {
  const ViewAllBody({super.key});

  @override
  State<ViewAllBody> createState() => _ViewAllBodyState();
}

class _ViewAllBodyState extends State<ViewAllBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<ViewAllProductsBloc>().loadMore(
              scrollController: _scrollController,
              loadMore: MediaQuery.of(context).size.height * 0.15,
            );
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAllProductsBloc, ViewAllProductsState>(
      builder: (context, state) {
        if (state is ViewAllProductsLoading && state.productsList.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              color: context.color.textColor,
            ),
          );
        } else if (state is ViewAllProductsError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                      return CustomProductItem(
                        imageUrl: state.productsList[index].images!.first
                            .imageProductFormate(),
                        title: state.productsList[index].title ?? '',
                        categoryName:
                            state.productsList[index].category!.name ?? '',
                        price: state.productsList[index].price ?? 0,
                        productId:
                            int.parse(state.productsList[index].id ?? '0'),
                      );
                    },
                    itemCount: state.productsList.length,
                    controller: _scrollController,
                    gridDelegate:
                        // ignore: lines_longer_than_80_chars
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 15,
                      childAspectRatio: 165 / 250,
                    ),
                  ),
                ),
                if (state is ViewAllProductsLoading &&
                    state.productsList.isNotEmpty)
                  CircularProgressIndicator(
                    color: context.color.textColor,
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}
