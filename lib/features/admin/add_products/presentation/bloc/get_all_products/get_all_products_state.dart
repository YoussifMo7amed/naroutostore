part of 'get_all_products_bloc.dart';

@freezed
class GetAllProductsState with _$GetAllProductsState {
  const factory GetAllProductsState.loading() = Loading;
  const factory GetAllProductsState.success(
      {required List<ProductGetAllModel> productList}) = Success;
  const factory GetAllProductsState.error({required String error}) = Error;
  const factory GetAllProductsState.empty() = Empty;
}
