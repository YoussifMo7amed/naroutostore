import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/customer/product_details_queries.dart';
import 'package:naroutoshop/features/customers/product_details/data/model/product_details_responce.dart';

class ProductDetailsDataSource {
  ProductDetailsDataSource(this._graphql);

  final ApiService _graphql;

  Future<ProductDetailsResponse> getProductDetails({required int productId }) async {
    final responce = await _graphql.productDetails(
      ProductDetailsQueries().getProductDetailsMapQuery(
        productId: productId,
      ),
    );
    return responce;
  }
}
