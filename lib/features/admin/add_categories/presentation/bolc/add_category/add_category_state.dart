part of 'add_category_bloc.dart';

@freezed
class AddCategoryState with _$AddCategoryState {
  const factory AddCategoryState.initial() = _Initial;
  const factory AddCategoryState.loading() = _LoadingState;
  const factory AddCategoryState.success() = _SuccessState;
  const factory AddCategoryState.error({required String error}) = _ErrorState;
}
