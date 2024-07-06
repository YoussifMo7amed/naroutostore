import 'package:naroutoshop/core/service/graphql/api_service.dart';
import 'package:naroutoshop/core/service/graphql/graphql_querirs/customer/home_queries.dart';
import 'package:naroutoshop/features/customers/home/data/models/banner_responce.dart';

class HomeDatasource {
  HomeDatasource._(this._graphQL);
  final ApiService _graphQL;

  Future<BannerResponce> getBanners() async {
    final responce = await _graphQL.getbanners(
      HomeQueries().getBannersMapQuery(),
    );
    return responce;
  }
}
