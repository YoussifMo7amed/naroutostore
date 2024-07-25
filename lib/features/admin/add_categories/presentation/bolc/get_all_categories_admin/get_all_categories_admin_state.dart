part of 'get_all_categories_admin_bloc.dart';

@freezed
class GetAllCategoriesAdminState with _$GetAllCategoriesAdminState {
  const factory GetAllCategoriesAdminState.loading() =
      _GetAllCategoriesAdminLoading;
  const factory GetAllCategoriesAdminState.success(
          {required GetAllCategoriesResponce getAllCategoriesResponce,}) =
      _GetAllCategoriesAdminSuccess;
  const factory GetAllCategoriesAdminState.empty() =
      _GetAllCategoriesAdminempty;
  const factory GetAllCategoriesAdminState.error({required String error}) =
      _GetAllCategoriesAdminError;
}
