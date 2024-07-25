import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/dashboard_admin_queries.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/categories_number_responce.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/products_number_responce.dart';
import 'package:naroutoshop/features/admin/dashboard/data/models/users_number_responce.dart';

class DashboardDataSource {
  DashboardDataSource(this._graphql);

  final ApiService _graphql;
  Future<ProductsNumberResponce> numberOfProducts() async {
    final response = await _graphql.numberOfProducts(
      AdminQueries.dashBoardQueries().numberOfproductMapQuery(),
    );
    return response;
  }

  Future<CategoriesNumberResponce> numberOfCategories() async {
    final response = await _graphql.numberOfCategories(
      AdminQueries.dashBoardQueries().numberOfCategoriesMapQuery(),
    );

    return response;
  }

  Future<UsersNumberResponce> numberOfUsers() async {
    final response = await _graphql.numberOfUsers(
      AdminQueries.dashBoardQueries().numberOfUsersMapQuery(),
    );
    return response;
  }
}
