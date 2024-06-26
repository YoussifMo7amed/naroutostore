import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_product_request_body.g.dart';

@JsonSerializable()
class CreateProdutRequestBody {
  CreateProdutRequestBody({
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.categoryId,
  });

  final String title;
  final String description;
  final double price;
  final List<String> images;
  final double categoryId;

  Map<String, dynamic> toJson() => _$CreateProdutRequestBodyToJson(this);
}
