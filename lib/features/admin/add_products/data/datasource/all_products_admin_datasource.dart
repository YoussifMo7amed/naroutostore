import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/products_admin_queries.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/create_product_request_body.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';

class GetAllProductsDataSource {
  GetAllProductsDataSource(this._graphql);
  final ApiService _graphql;
//get all products
  Future<GetAllProductResponce> getAllProducts() async {
    final responce = await _graphql.getAllProducts(
      AllProductsAdminQueries().getAllProductsMapQuery(),
    );
    return responce;
  }
  //create product
    Future<void> createProduct({required CreateProdutRequestBody body}) async {
    final responce = await _graphql.createProduct(
      AllProductsAdminQueries().createProductMapQuery(
        body: body,
      ),
    );
    return responce;
  }

    Future<void> deleteProduct({required String productId}) async {
    final responce = await _graphql.deleteProduct(
      AllProductsAdminQueries().deleteProduct(productid: productId),
    );
    return responce;
  }



  
}
