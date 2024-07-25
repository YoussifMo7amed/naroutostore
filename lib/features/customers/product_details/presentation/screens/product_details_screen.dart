import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_customer.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/features/customers/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:naroutoshop/features/customers/product_details/presentation/refactors/product_deatils_custom_painter.dart';
import 'package:naroutoshop/features/customers/product_details/presentation/refactors/product_details_bottom.dart';
import 'package:naroutoshop/features/customers/product_details/presentation/refactors/ptoduct_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.productId, super.key});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsBloc>()
        ..add(
          ProductDetailsEvent.getProductDetails(productId: productId),
        ),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            success: (productModel) => Scaffold(
              appBar: AppBarCustomer(
                tittle: productModel.title!.convertLongString(),
              ),
              bottomNavigationBar: ProductDetailsBottom(
                price: productModel.price ?? 0,
              ),
              body: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height,
                    ),
                    painter: DetailsCustomPainter(
                      gradient: LinearGradient(
                        colors: [
                          context.color.bluePinkLight!,
                          context.color.bluePinkDark!,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  PtoductDetailsBody(
                    productModel: productModel,
                  ),
                ],
              ),
            ),
            error: (error) => Scaffold(
              appBar: const AppBarCustomer(tittle: 'Product Details'),
              body: Center(
                child: Text(error),
              ),
            ),
          );
        },
      ),
    );
  }
}
