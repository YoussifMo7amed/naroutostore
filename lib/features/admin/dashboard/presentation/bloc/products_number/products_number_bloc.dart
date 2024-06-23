import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/dashboard/data/repos/dashboard_repo.dart';

part 'products_number_event.dart';
part 'products_number_state.dart';
part 'products_number_bloc.freezed.dart';

class ProductsNumberBloc
    extends Bloc<ProductsNumberEvent, ProductsNumberState> {
  ProductsNumberBloc(this._repo) : super(const _LoadingState()) {
    on<ProductsNumberEvent>(_productNumber);
  }
  final DashboardRepo _repo;
  FutureOr<void> _productNumber(
      ProductsNumberEvent event, Emitter<ProductsNumberState> emit,) async {
    emit(const ProductsNumberState.loading());
    final result = await _repo.numberOfProducts();
    result.when(
      success: (productsData) {
        emit(ProductsNumberState.success(Number: productsData.number));
      },
      failure: (error) {
        emit(ProductsNumberState.error(error: error));
      },
    );
  }
}
