import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_categories/data/datasource/get_all_categories_datasource.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';

class GetAllCategoriesRepo {
  GetAllCategoriesRepo(this._dataSource);
  final GetAllCategoriesDataSource _dataSource;

  Future<ApiResult<GetAllCategoriesResponce>> getAllCategories(
    ) async {
    try {
      final responce = await _dataSource.getAllCategories();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
}
