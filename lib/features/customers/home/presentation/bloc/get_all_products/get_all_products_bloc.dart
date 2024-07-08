import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/home/data/repo/home_repo.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';
part 'get_all_products_bloc.freezed.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc(this._repo) : super(const GetAllProductsState.loading()) {
    on<FetchAllProductsEvent>(_getAllProducts);
  }
  final HomeRepo _repo;
  bool ListIsLessThan10 = true;
  FutureOr<void> _getAllProducts(
    FetchAllProductsEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    emit(const GetAllProductsState.loading());
    final responce = await _repo.getAllProducts();
    responce.when(
      success: (data) {
       
        if (data.productGetAllList.isEmpty) {
          emit(const GetAllProductsState.empty());
        } else {
          emit(GetAllProductsState.success(productList: data.productGetAllList));
        }
      },
      failure: (error) {
        emit(GetAllProductsState.error(error: error));
      },
    );
  }
}
