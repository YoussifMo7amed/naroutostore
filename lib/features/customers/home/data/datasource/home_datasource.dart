import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/categories_admin_queries.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/admin/products_admin_queries.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/customer/home_queries.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/home/data/models/banner_responce.dart';

class BannersDataSource {
  BannersDataSource(this._graphql);

  final ApiService _graphql;

  Future<BannerResponce> getAllBanners() async {
    final responce = await _graphql.getbanners(
      HomeQueries().getBannersMapQuery(),
    );
    return responce;
  }

    Future<GetAllCategoriesResponce> getAllCategories() async {
    final responce = await _graphql.getAllCategories(
      AllCategoriesAdminQueries().getAllCategoriesMapQuery(),
    );
    return responce;
  }
  //get all products
  Future<GetAllProductResponce> getAllProducts() async {
    final responce = await _graphql.getAllProducts(
      AllProductsAdminQueries().getAllProductsMapQuery(),
    );
    return responce;
  }
}
