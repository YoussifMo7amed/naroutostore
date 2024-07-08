import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/home/data/datasource/home_datasource.dart';
import 'package:naroutoshop/features/customers/home/data/models/banner_responce.dart';

class HomeRepo {
  HomeRepo(this._dataSource);

  final BannersDataSource _dataSource;

  Future<ApiResult<BannerResponce>> getBanners() async {
    try {
      final responce = await _dataSource.getAllBanners();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
  //get all categories
    Future<ApiResult<GetAllCategoriesResponce>> getAllCategories() async {
    try {
      final responce = await _dataSource.getAllCategories();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
  //get all products
  Future<ApiResult<GetAllProductResponce>> getAllProducts() async {
    try {
      final responce = await _dataSource.getAllProducts();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
}
