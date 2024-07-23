import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_categories/data/models/get_all_categories_responce.dart';
import 'package:naroutoshop/features/customers/home/data/repo/home_repo.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';
part 'get_all_categories_bloc.freezed.dart';

class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesBloc(this._repo)
      : super(const GetAllCategoriesState.loading()) {
    on<fetchCategoriesEvent>(_getAllCategories);
  }
  final HomeRepo _repo;
  FutureOr<void> _getAllCategories(
    fetchCategoriesEvent event,
    Emitter<GetAllCategoriesState> emit,
  ) async {
    final result = await _repo.getAllCategories();
    result.when(
      success: (data) {
        if (data.categoriesGetAllList.isEmpty) {
          emit(const GetAllCategoriesState.empty());
        } else {
          emit(
            GetAllCategoriesState.success(
                categoriesList: data.categoriesGetAllList,),
          );
        }
      },
      failure: (error) => emit(
        GetAllCategoriesState.error(error: error),
      ),
    );
  }
}
