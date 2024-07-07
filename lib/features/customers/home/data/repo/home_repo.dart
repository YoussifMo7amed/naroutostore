import 'package:naroutoshop/core/service/graphql/api_result.dart';
import 'package:naroutoshop/features/customers/home/data/datasource/home_datasource.dart';
import 'package:naroutoshop/features/customers/home/data/models/banner_responce.dart';

class HomeRepo {
  HomeRepo(this._datasource);

  final BannersDataSource _datasource;

  Future<ApiResult<BannerResponce>> getBanners() async {
    try {
      final responce = await _datasource.getAllBanners();
      return ApiResult.success(responce);
    } catch (e) {
      return const ApiResult.failure(
        'Please try again later, Something went wrong',
      );
    }
  }
}
