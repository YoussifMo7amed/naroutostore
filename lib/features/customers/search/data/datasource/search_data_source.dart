import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/customer/search_queries.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/search/data/models/search_request_body.dart';

class SearchDatasource {
  SearchDatasource(this._graphql);

  final ApiService _graphql;

  // ignore: non_constant_identifier_names
  Future<GetAllProductResponse> SearchForProducts(
      {required SearchRequestBody body,}) async {
    final responce = await _graphql.searchProducts(
      SearchQueries().getSearchQueriesMapQuery(
        body: body,
      ),
    );
    return responce;
  }
}
