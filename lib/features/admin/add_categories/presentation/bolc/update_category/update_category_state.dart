part of 'update_category_bloc.dart';

@freezed
class UpdateCategoryState with _$UpdateCategoryState {
  const factory UpdateCategoryState.initial() = _Initial;
  const factory UpdateCategoryState.loading() = _LoadingState;
  const factory UpdateCategoryState.success() = _SuccessState;
  const factory UpdateCategoryState.error({required String error}) =
      _ErrorState;
}
