import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_categories/data/repo/get_all_categories_repo.dart';

part 'delete_category_event.dart';
part 'delete_category_state.dart';
part 'delete_category_bloc.freezed.dart';

class DeleteCategoryBloc
    extends Bloc<DeleteCategoryEvent, DeleteCategoryState> {
  DeleteCategoryBloc(this._repo) : super(const _Initial()) {
    on<DeletenewCategoryEvent>(_deleteCategory);
  }
  final GetAllCategoriesRepo _repo;
  FutureOr<void> _deleteCategory(
      DeletenewCategoryEvent event, Emitter<DeleteCategoryState> emit,) async {
    emit(DeleteCategoryState.loading(categoryId: event.categoryId));
    final result = await _repo.deleteCategories(id: event.categoryId);
    result.when(
      success: (_) {
        emit(const DeleteCategoryState.success());
      },
      failure: (error) {
        emit(DeleteCategoryState.error(error: error));
      },
    );
  }
}
