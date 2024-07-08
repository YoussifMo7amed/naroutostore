import 'dart:async';
import 'package:flutter/widgets.dart';
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
  bool listIsLessThan10 = false;
  FutureOr<void> _getAllProducts(
    FetchAllProductsEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    emit(const GetAllProductsState.loading());
    final responce = await _repo.getAllProducts();
    responce.when(
      success: (data) {
        listIsLessThan10 = data.productGetAllList.length >= 10? true : false;
        if (data.productGetAllList.isEmpty) {
          emit(const GetAllProductsState.empty());
            debugPrint('=======>'+ listIsLessThan10.toString());
        } else {
          debugPrint('=======>'+ listIsLessThan10.toString());
          emit(
              GetAllProductsState.success(productList: data.productGetAllList));
        }
      },
      failure: (error) {
        emit(GetAllProductsState.error(error: error));
      },
    );
  }
}
