import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/customers/product_details/data/model/product_details_responce.dart';
import 'package:naroutoshop/features/customers/product_details/data/product_details_repo/product_details_repo.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc( this._repo) : super(const ProductDetailsState.loading()) {
    on<GetProductDetailsEvent>(_getProductDetails);
  }
  ProductDetailsRepo _repo;
  FutureOr<void> _getProductDetails(
      GetProductDetailsEvent event, Emitter<ProductDetailsState> emit) async {
    emit(const ProductDetailsState.loading());
    final result = await _repo.getProductDetails(productId: event.productId);
    result.when(
      success: (data) {
        emit(ProductDetailsState.success(productDetails: data.data.products));
      },
      failure: (error) {
        emit(ProductDetailsState.error(error: error));
      },
    );
  }
}
