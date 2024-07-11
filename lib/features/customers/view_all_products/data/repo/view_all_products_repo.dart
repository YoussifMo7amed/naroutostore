import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/view_all_products/data/datasource/view_all_product_datasource.dart';

class ViewAllProductsRepo {
  ViewAllProductsRepo(this._dataSource);

  final ViewAllProductsDatasource _dataSource;

  Future<ApiResult<GetAllProductResponse>> getViewAllProducts({
    required int offset,
  }) async {
    try {
      final responce = await _dataSource.viewAllProducts(
        offset: offset,
      );
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
}
