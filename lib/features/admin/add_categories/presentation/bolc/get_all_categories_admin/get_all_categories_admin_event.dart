part of 'get_all_categories_admin_bloc.dart';

@freezed
class GetAllCategoriesAdminEvent with _$GetAllCategoriesAdminEvent {
  const factory GetAllCategoriesAdminEvent.started() = _Started;
  const factory GetAllCategoriesAdminEvent.fetchAdminCategories({
    required bool isNotLoading,
  }) =
      fetchCategoriesEvent;
}
