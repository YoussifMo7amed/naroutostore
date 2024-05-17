import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/get_all_categories_queries.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';

class GetAllCategoriesDataSource {
  GetAllCategoriesDataSource(this._graphql);

  final ApiService _graphql;

  Future<GetAllCategoriesResponce> getAllCategories() async {
    final responce = await _graphql.getAllCategories(
      GetAllCategoriesQueries().GetAllCategoriesCategoriesMapQuery(),
    );
    return responce;
  }
}
