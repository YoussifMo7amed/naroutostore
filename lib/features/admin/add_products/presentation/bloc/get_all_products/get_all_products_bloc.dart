import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/admin/add_products/data/repo/get_all_products_repo.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';
part 'get_all_products_bloc.freezed.dart';

class GetAllProductsAdminBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsAdminBloc(this._repo)
      : super(const GetAllProductsState.loading()) {
    on<FetchAllProductsAdminEvent>(getAllProducts);
  }
  final GetAllProductssRepo _repo;
  FutureOr<void> getAllProducts(
    FetchAllProductsAdminEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    if (event.isLoading) {
      emit(const GetAllProductsState.loading());
    }
    final result = await _repo.getAllProducts();
    result.when(
      success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(const GetAllProductsState.empty());
        } else {
          emit(
              GetAllProductsState.success(productList: data.productGetAllList));
        }
      },
      failure: (error) => emit(GetAllProductsState.error(error: error)),
    );
  }
}
