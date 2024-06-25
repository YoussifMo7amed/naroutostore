import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/admin/add_products/data/datasource/all_products_admin_datasource.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';

class GetAllProductssRepo {
  GetAllProductssRepo(this._dataSource);
  final GetAllProductsDataSource _dataSource;

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
