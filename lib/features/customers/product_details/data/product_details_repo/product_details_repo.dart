import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/customers/product_details/data/datasource/product_details_datasource.dart';
import 'package:naroutoshop/features/customers/product_details/data/model/product_details_responce.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._dataSource);

  final ProductDetailsDataSource _dataSource;

  Future<ApiResult<ProductDetailsResponse>> getProductDetails({
    required int productId,
  }) async {
    try {
      final responce = await _dataSource.getProductDetails(
        productId: productId,
      );
      return ApiResult.success(responce);
    } catch (e) {
      return  const ApiResult.failure(
      'Please try again later, Something went wrong',
      );
    }
  }
}
