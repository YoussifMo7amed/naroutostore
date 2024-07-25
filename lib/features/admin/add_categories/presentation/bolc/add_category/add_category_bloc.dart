import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/create_category_request.dart';
import 'package:naroutoshop/features/admin/add_categories/data/repo/get_all_categories_repo.dart';

part 'add_category_event.dart';
part 'add_category_state.dart';
part 'add_category_bloc.freezed.dart';

class AddCategoryBloc extends Bloc<AddCategoryEvent, AddCategoryState> {
  AddCategoryBloc(this._repo) : super(const _Initial()) {
    on<NewAddCategoriesEvent>(addCategory);
  }
  final GetAllCategoriesRepo _repo;
  FutureOr<void> addCategory(
    NewAddCategoriesEvent event,
    Emitter<AddCategoryState> emit,
   ) async {

    emit(const AddCategoryState.loading());
    final result = await _repo.addCategories(body: event.body);
    result.when(
    success: (data) {
      emit(const AddCategoryState.success());
    },
    failure: (error) {
      emit(AddCategoryState.error(error: error));
    },
    );
  }
}
