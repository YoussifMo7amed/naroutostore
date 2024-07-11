import 'package:equatable/equatable.dart';
import 'package:naroutoshop/features/admin/add_products/data/model/get_all_product_responce.dart';

abstract class ViewAllProductsState extends Equatable {
  const ViewAllProductsState({
    required this.productsList,
    required this.hasMore,
  });
  final List<ProductGetAllModel> productsList;
  final bool hasMore;
    @override
  List<Object?> get props => [productsList, hasMore];
}

class ViewAllProductsInitial extends ViewAllProductsState {
  const ViewAllProductsInitial({
    required super.productsList,
    required super.hasMore,
  });
}

class ViewAllProductsLoading extends ViewAllProductsState {
  const ViewAllProductsLoading({
    required super.productsList,
    required super.hasMore,
  });
}

class ViewAllProductsSuccess extends ViewAllProductsState {
  const ViewAllProductsSuccess({
    required super.productsList,
    required super.hasMore,
  });
}

class ViewAllProductsError extends ViewAllProductsState {
  const ViewAllProductsError({
    required super.productsList,
    required super.hasMore,
    required this.errorMessage,
  });
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
