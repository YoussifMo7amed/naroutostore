import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/admin/add_categories/data/repo/get_all_categories_repo.dart';

part 'get_all_categories_admin_event.dart';
part 'get_all_categories_admin_state.dart';
part 'get_all_categories_admin_bloc.freezed.dart';

class GetAllCategoriesAdminBloc
    extends Bloc<GetAllCategoriesAdminEvent, GetAllCategoriesAdminState> {
  GetAllCategoriesAdminBloc(this._repo)
      : super(const GetAllCategoriesAdminState.loading()) {
    on<fetchCategoriesEvent>(_getAllCategories);
  }
  final GetAllCategoriesRepo _repo;
  FutureOr<void> _getAllCategories(
    fetchCategoriesEvent event,
    Emitter<GetAllCategoriesAdminState> emit,
  ) async {
    if (event.isNotLoading) {
      emit(const GetAllCategoriesAdminState.loading());
     }
    final result = await _repo.getAllCategories();
    result.when(
      success: (data) {
        if (data.categoriesGetAllList.isEmpty) {
          emit(const GetAllCategoriesAdminState.empty());
        } else {
          emit(
            GetAllCategoriesAdminState.success(getAllCategoriesResponce: data),
          );
        }
      },
      failure: (error) => emit(
        GetAllCategoriesAdminState.error(error: error),
      ),
    );
  }
}
