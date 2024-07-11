import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/features/customers/view_all_products/data/repo/view_all_products_repo.dart';
import 'package:naroutoshop/features/customers/view_all_products/presentation/bloc/view_all_products/view_all_products_event.dart';
import 'package:naroutoshop/features/customers/view_all_products/presentation/bloc/view_all_products/view_all_products_state.dart';

class ViewAllProductsBloc
    extends Bloc<ViewAllProductsEvent, ViewAllProductsState> {
  ViewAllProductsBloc(this._repo)
      : super(
          const ViewAllProductsInitial(
            productsList: [],
            hasMore: true,
          ),
        ) {
    on<GetProductsViewAllEvent>(_getViewAllProducts);
    on<LoadMoreProductsEvent>(_loadMoreProducts);
  }

  final ViewAllProductsRepo _repo;
  int offset = 6;
  FutureOr<void> _getViewAllProducts(
    GetProductsViewAllEvent event,
    Emitter<ViewAllProductsState> emit,
  ) async {
    emit(
      const ViewAllProductsLoading(
        productsList: [],
        hasMore: true,
      ),
    );

    final responce = await _repo.getViewAllProducts(
      offset: 0,
    );

    responce.when(
      success: (responce) {
        emit(
          ViewAllProductsSuccess(
            productsList: responce.productGetAllList,
            hasMore: true,
          ),
        );
      },
      failure: (message) {
        emit(
          ViewAllProductsError(
            productsList: state.productsList,
            hasMore: true,
            errorMessage: message,
          ),
        );
      },
    );
  }

  FutureOr<void> _loadMoreProducts(
    LoadMoreProductsEvent event,
    Emitter<ViewAllProductsState> emit,
  ) async {
    if (!state.hasMore) return;

    offset += 6;
    emit(
      ViewAllProductsLoading(
        productsList: state.productsList,
        hasMore: state.hasMore,
      ),
    );

    final responce = await _repo.getViewAllProducts(
      offset: offset,
    );

    responce.when(
      success: (responce) {
        emit(
          ViewAllProductsSuccess(
            productsList: [
              ...state.productsList,
              ...responce.productGetAllList,
            ],
            hasMore: !(responce.productGetAllList.length < 6),
          ),
        );
      },
      failure: (message) {
        emit(
          ViewAllProductsError(
            productsList: state.productsList,
            hasMore: state.hasMore,
            errorMessage: message,
          ),
        );
      },
    );
  }
}
