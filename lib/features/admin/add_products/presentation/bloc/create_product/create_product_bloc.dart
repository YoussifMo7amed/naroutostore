import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/create_product_request_body.dart';
import 'package:naroutoshop/features/admin/add_products/data/repo/get_all_products_repo.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';
part 'create_product_bloc.freezed.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductBloc(this._repo) : super(const _Initial()) {
    on<NewCreateProductEvent>(_createProduct);
  }
  final GetAllProductssRepo _repo;
  FutureOr<void> _createProduct(
    NewCreateProductEvent event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(const CreateProductState.loading());
    final result = await _repo.createProduct(body: event.body);
    result.when(
      success: (data) {
        emit(const CreateProductState.success());
      },
      failure: (error) => emit(CreateProductState.error(error: error)),
    );
  }
}
