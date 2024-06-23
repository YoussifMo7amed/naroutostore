import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_categories/data/datasource/all_categories__admin_datasource.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/update_category_request.dart';

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
  //
   Future<ApiResult<CreateCategoryResponce>> addCategories(
      {required CreateCategoryRequestBody body,}) async {
    try {
      final responce = await _dataSource.addCategories(body: body);
      return ApiResult.success(responce);
    } catch (e) {
      return  const ApiResult.failure(
        'Please try again later, Something',
      );
    }
  }

  Future<ApiResult<void>> deleteCategories({required String id}) async {
    try {
      final responce = await _dataSource.deleteCategories(id: id);
      return ApiResult.success(responce);
    } catch (e) {
      return const  ApiResult.failure(
        'Please try again later, Something went wrong }',
      );
    }
  }
    Future<ApiResult<void>> updateCategories({required UpdateCategoryRequestBody body}) async {
    try {
      final responce = await _dataSource.updateCategories(body: body);
      return ApiResult.success(responce);
    } catch (e) {
      return const  ApiResult.failure(
        'Please try again later, Something went wrong }',
      );
    }
  }
}
