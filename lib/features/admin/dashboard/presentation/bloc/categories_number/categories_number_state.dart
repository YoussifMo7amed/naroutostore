part of 'categories_number_bloc.dart';

@freezed
class CategoriesNumberState with _$CategoriesNumberState {
  const factory CategoriesNumberState.loading() = _LoadingState;
  const factory CategoriesNumberState.success({required String Number})= _SuccessState;
  const factory CategoriesNumberState.error({required String error}) = _ErrorState;}
