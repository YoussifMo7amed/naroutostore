import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/products_admin_queries.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';

class GetAllProductsDataSource {
  GetAllProductsDataSource(this._graphql);
  final ApiService _graphql;

  Future<GetAllProductResponce> getAllProducts() async {
    final responce = await _graphql.getAllProducts(
      AllProductsAdminQueries().getAllProductsMapQuery(),
    );
    return responce;
  }
}
