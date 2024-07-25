part of 'get_all_products_bloc.dart';

@freezed
class GetAllProductsState with _$GetAllProductsState {
  const factory GetAllProductsState.loading() = LoadingState;
  const factory GetAllProductsState.success(
      {required List<ProductGetAllModel> productList,}) = SuccessState;
  const factory GetAllProductsState.error({required String error}) = ErrorState;
  const factory GetAllProductsState.empty() = EmptyState;
}
