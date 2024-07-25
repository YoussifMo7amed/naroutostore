part of 'categories_number_bloc.dart';

@freezed
class CategoriesNumberState with _$CategoriesNumberState {
  const factory CategoriesNumberState.loading() = _LoadingState;
  // ignore: non_constant_identifier_names
  const factory CategoriesNumberState.success({required String Number}) =
      _SuccessState;
  const factory CategoriesNumberState.error({required String error}) =
      _ErrorState;
}
