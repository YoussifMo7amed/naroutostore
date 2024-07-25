import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/categories/data/datasource/category_data_source.dart';

class CategoryRepo {
  CategoryRepo(this._dataSource);

  final CategoryDataSource _dataSource;

  Future<ApiResult<GetAllProductResponse>> getCategory({
    required int categoryId,
  }) async {
    try {
      final responce = await _dataSource.getCategory(
        categoryId: categoryId,
      );
      return ApiResult.success(responce);
    } catch (e) {
      return ApiResult.failure(
        e.toString(),
      );
    }
  }
}
