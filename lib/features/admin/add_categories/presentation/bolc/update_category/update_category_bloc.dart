import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/update_category_request.dart';
import 'package:naroutoshop/features/admin/add_categories/data/repo/get_all_categories_repo.dart';

part 'update_category_event.dart';
part 'update_category_state.dart';
part 'update_category_bloc.freezed.dart';

class UpdateCategoryBloc extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  UpdateCategoryBloc(this._repo) : super(const _Initial()) {
    on<UpdateNewCategoryEvent>(_updateCategory);
  }
  final GetAllCategoriesRepo _repo;
  FutureOr<void> _updateCategory(UpdateNewCategoryEvent event,  Emitter<UpdateCategoryState> emit) async{
    emit(const UpdateCategoryState.loading());

    final result = await _repo.updateCategories(body: event.body);
    result.when(
      success: (data) {
        emit(const UpdateCategoryState.success());
      },
      failure: (error) {
        emit(UpdateCategoryState.error(error: error));
      },
    );

  }
}
