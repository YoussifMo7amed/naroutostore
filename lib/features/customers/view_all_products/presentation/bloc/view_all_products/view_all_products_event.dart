import 'package:equatable/equatable.dart';

abstract class ViewAllProductsEvent extends Equatable {
  const ViewAllProductsEvent();
  @override
  List<Object?> get props => [];
}

class GetProductsViewAllEvent extends ViewAllProductsEvent {
  const GetProductsViewAllEvent();
}

class LoadMoreProductsEvent extends ViewAllProductsEvent {
  const LoadMoreProductsEvent();
}
