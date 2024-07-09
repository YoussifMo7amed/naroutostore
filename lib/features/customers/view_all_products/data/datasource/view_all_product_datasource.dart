import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/customer/products_view_all_queries.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';

class ViewAllProductDatasource {
  ViewAllProductDatasource(this._graphql);

  final ApiService _graphql;

  Future<GetAllProductResponse> viewAllProducts({required int offset }) async {
    final responce = await _graphql.viewAllProducts(
      ProductViewAllQueries().getProductsViewAllMapQuery(
        offset: offset,
      ),
    );
    return responce;
  }
}