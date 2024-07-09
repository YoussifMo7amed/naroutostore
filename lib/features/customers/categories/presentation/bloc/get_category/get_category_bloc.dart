import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/categories/data/repo/category_repo.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';
part 'get_category_bloc.freezed.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  GetCategoryBloc(this._repo) : super(const GetCategoryState.loading()) {
    on<FetchProductsEvent>(_getCategory);
  }
  final CategoryRepo _repo;
  FutureOr<void> _getCategory(
    FetchProductsEvent event,
    Emitter<GetCategoryState> emit,
  ) async {
    emit(const GetCategoryState.loading());
    final result = await _repo.getCategory(
      categoryId: event.categoryId,
    );
    result.when(
      success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(const GetCategoryState.empty());
        } else {
          emit(GetCategoryState.success(productModel: data.productGetAllList));
        }
      },
      failure: (message) {
        emit(GetCategoryState.error(error: message));
      },
    );
  }
}
