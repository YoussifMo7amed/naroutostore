import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/search/data/datasource/search_data_source.dart';
import 'package:naroutoshop/features/customers/search/data/models/search_request_body.dart';

class SearchRepo {
  SearchRepo(this._dataSource);

  final SearchDatasource _dataSource;

  Future<ApiResult<GetAllProductResponse>> searchProducts({
    required SearchRequestBody body,
  }) async {
    try {
      final responce = await _dataSource.SearchForProducts(
        body: body,
      );
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
}
