import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/update_product_request_body.dart';
import 'package:naroutoshop/features/admin/add_products/data/repo/get_all_products_repo.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';
part 'update_product_bloc.freezed.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  UpdateProductBloc(this._repo) : super(const _Initial()) {
    on<NewUpdateProductEvent>(_updateProduct);
  }

  final GetAllProductssRepo _repo;
  FutureOr<void> _updateProduct(
    NewUpdateProductEvent event,
    Emitter<UpdateProductState> emit,
  ) async {
    emit(const UpdateProductState.loading());

    final result = await _repo.updateProducts(body: event.body);
    result.when(
      success: (data) {
        emit(const UpdateProductState.success());
      },
      failure: (error) {
        emit(UpdateProductState.error(error: error));
      },
    );
  }
}
