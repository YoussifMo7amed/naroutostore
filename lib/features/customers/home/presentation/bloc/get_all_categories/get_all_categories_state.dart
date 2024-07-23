part of 'get_all_categories_bloc.dart';

@freezed
class GetAllCategoriesState with _$GetAllCategoriesState {
  const factory GetAllCategoriesState.loading() = _GetAllCategoriesLoadingState;
  const factory GetAllCategoriesState.success(
          {required List<GetAllCategoriesModel> categoriesList,}) =
      _GetAllCategoriesSuccessState;
  const factory GetAllCategoriesState.empty() = _GetAllCategoriesemptyState;
  const factory GetAllCategoriesState.error({required String error}) =
      _GetAllCategoriesErrorState;
}
