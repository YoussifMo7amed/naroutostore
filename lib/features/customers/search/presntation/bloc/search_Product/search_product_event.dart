part of 'search_product_bloc.dart';

@freezed
class SearchProductEvent with _$SearchProductEvent {
  const factory SearchProductEvent.started() = _Started;
  const factory SearchProductEvent.searchProduct(
      {required SearchRequestBody body,}) = SearchForProductEvent;
}
