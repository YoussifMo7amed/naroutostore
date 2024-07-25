part of 'products_number_bloc.dart';

@freezed
class ProductsNumberState with _$ProductsNumberState {
  const factory ProductsNumberState.loading() = _LoadingState;
  // ignore: non_constant_identifier_names
  const factory ProductsNumberState.success({required String Number}) =
      _SuccessState;
  const factory ProductsNumberState.error({required String error}) =
      _ErrorState;
}
