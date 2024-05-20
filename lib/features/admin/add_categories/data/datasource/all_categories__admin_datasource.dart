import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/categories_admin_queries.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/update_category_request.dart';

class GetAllCategoriesDataSource {
  GetAllCategoriesDataSource(this._graphql);

  final ApiService _graphql;

  Future<GetAllCategoriesResponce> getAllCategories() async {
    final responce = await _graphql.getAllCategories(
      AllCategoriesAdminQueries().getAllCategoriesCategoriesMapQuery(),
    );
    return responce;
  }

  Future<CreateCategoryResponce> addCategories(
      {required CreateCategoryRequestBody body}) async {
    final responce = await _graphql.createCategory(
      AllCategoriesAdminQueries().createCategory(body: body),
    );
    return responce;
  }

  Future<void> deleteCategories({required String id}) async {
    final responce = await _graphql.deleteCategory(
      AllCategoriesAdminQueries().deleteCategory(id: id),
    );
    return responce;
  }

  Future<void> updateCategories({
    required UpdateCategoryRequestBody body,
  }) async {
    final responce = await _graphql.updateCategory(
      AllCategoriesAdminQueries().updateCategory(body: body),
    );
    return responce;
  }
}
