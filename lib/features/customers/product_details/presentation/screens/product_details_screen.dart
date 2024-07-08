import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_customer.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/customers/product_details/presentation/refactors/product_deatils_custom_painter.dart';
import 'package:naroutoshop/features/customers/product_details/presentation/refactors/product_details_bottom.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.productId, super.key});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarCustomer(tittle: 'Product Details'),
      bottomNavigationBar: ProductDetailsBottom(price: 100),
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
        ]
      ),
    );
  }
}
