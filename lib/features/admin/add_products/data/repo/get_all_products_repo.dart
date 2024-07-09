import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_products/data/datasource/all_products_admin_datasource.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/create_product_request_body.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/update_product_request_body.dart';

class GetAllProductssRepo {
  GetAllProductssRepo(this._dataSource);
  final GetAllProductsDataSource _dataSource;

  Future<ApiResult<GetAllProductResponse>> getAllProducts() async {
    try {
      final responce = await _dataSource.getAllProducts();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }

  Future<ApiResult<void>> createProduct(
      {required CreateProdutRequestBody body}) async {
    try {
      final responce = await _dataSource.createProduct(
        body: body,
      );
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }

  Future<ApiResult<void>> deleteProduct({required String productId}) async {
    try {
      final responce = await _dataSource.deleteProduct(productId: productId);
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong }',
      );
    }
  }

  Future<ApiResult<void>> updateProducts(
      {required UpdateProductRequestBody body,}) async {
    try {
      final responce = await _dataSource.updateProducts(body: body);
      return ApiResult.success(responce);
    } catch (e) {
      return  ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
}
