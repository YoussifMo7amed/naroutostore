import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_number_responce.g.dart';

@JsonSerializable()
class ProductsNumberResponce {
  ProductsNumberResponce(this.data);
  factory ProductsNumberResponce.fromjson(Map<String, dynamic> json) =>
      _$ProductsNumberResponceFromJson(json);
  ProductsNumberData? data;
  String get number {
    if (data!.productsList!.isEmpty) {
      return '0';
    } else {
      return data!.productsList!.length.toString();
    }
  }
}

@JsonSerializable()
class ProductsNumberData {
  ProductsNumberData(this.productsList);
  factory ProductsNumberData.fromjson(Map<String, dynamic> json) =>
      _$ProductsNumberDataFromJson(json);
  @JsonKey(name: 'products')
  List<ProductsNumberModel>? productsList;
}

@JsonSerializable()
class ProductsNumberModel {
  ProductsNumberModel(this.title);
  factory ProductsNumberModel.fromjson(Map<String, dynamic> json) =>
      _$ProductsNumberModelFromJson(json);
  final String? title;
}
