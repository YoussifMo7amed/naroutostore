import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/dashboard/data/datasource/dashboard_datasource.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/categories_number_responce.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/products_number_responce.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/users_number_responce.dart';

class DashboardRepo {
  DashboardRepo(this._dashboardDataSource);
  final DashboardDataSource _dashboardDataSource;
  Future<ApiResult<ProductsNumberResponce>> numberOfProducts() async {
    try {
      final response = await _dashboardDataSource.numberOfProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<CategoriesNumberResponce>> numberOfCategories() async {
    try {
      final response = await _dashboardDataSource.numberOfCategories();
      return  ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<UsersNumberResponce>> numberOfUsers() async {
    try {
      final response = await _dashboardDataSource.numberOfUsers();
     return ApiResult.success(response);
    } catch (e) {
     return ApiResult.failure(e.toString());
    }
  }
}
