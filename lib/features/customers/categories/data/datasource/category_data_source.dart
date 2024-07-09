import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/customer/category_queries.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';

class CategoryDataSource {
  CategoryDataSource(this._graphql);

  final ApiService _graphql;

  Future<GetAllProductResponse> getCategory({required int categoryId }) async {
    final responce = await _graphql.getCategory(
      CategoryQueries().getCategoryQueriesMapQuery(
        categoryId: categoryId,
      ),
    );
    return responce;
  }
}