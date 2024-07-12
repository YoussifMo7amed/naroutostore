part of 'search_product_bloc.dart';

@freezed
class SearchProductState with _$SearchProductState {
  const factory SearchProductState.initial() = _Initial;
    const factory SearchProductState.loading() = LoadingState;

  const factory SearchProductState.success({required List<ProductGetAllModel> productsList}) = SuccessState;
  const factory SearchProductState.empty() = EmptyState;
  const factory SearchProductState.error({required String error}) = ErrorState;



}
