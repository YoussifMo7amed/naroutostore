import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';
import 'package:naroutoshop/features/customers/search/data/models/search_request_body.dart';
import 'package:naroutoshop/features/customers/search/data/repo/search_repo.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';
part 'search_product_bloc.freezed.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  SearchProductBloc(this._repo) : super(const _Initial()) {
    on<SearchForProductEvent>(_searchProduct);
  }
  final SearchRepo _repo;

  FutureOr<void> _searchProduct(
    SearchForProductEvent event,
    Emitter<SearchProductState> emit,
  ) async {
    emit(const SearchProductState.loading());
    final responce = await _repo.searchProducts(
      body: event.body,
    );
    responce.when(
      success: (data) {
        if (data.productGetAllList.isEmpty) {
          emit(const SearchProductState.empty());
        } else {
          emit(
            SearchProductState.success(productsList: data.productGetAllList),
          );
        }
      },
      failure: (error) {
        emit(SearchProductState.error(error: error));
      },
    );
  }
}
