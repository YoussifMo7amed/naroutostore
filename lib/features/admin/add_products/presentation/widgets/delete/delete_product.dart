import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/get_all_products/get_all_products_bloc.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({required this.productId, super.key});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteProductBloc, DeleteProductState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            context.read<GetAllProductsBloc>().add(
                  const GetAllProductsEvent.getAllProducts(isLoading: false),
                );
            ShowToast.showToastSuccessTop(
                message: 'Product Deleted successfully',);
          },
          error: (error) {
            ShowToast.showToastErrorTop(
              message: error,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == productId) {
              return SizedBox(
                height: 15.h,
                width: 15.w,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else {
              return const Icon(
                Icons.delete,
                color: Colors.red,
              );
            }
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<DeleteProductBloc>().add(
                      DeleteProductEvent.deleteProduct(
                        productId: productId,
                      ),
                    );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            );
          },
        );
      },
    );
  }
}
// mutation {
// 	updateProduct(id: "120", changes: { title: "udpate" }) {
// 		title
// 		price
// 		images
// 	}
// }