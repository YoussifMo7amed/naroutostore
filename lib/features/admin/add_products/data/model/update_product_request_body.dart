import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_product_request_body.g.dart';

@JsonSerializable()
class UpdateProductRequestBody {
  UpdateProductRequestBody({
    required this.title,
    required this.description,
    required this.price,
    required this.imageList,
    required this.categoryId,
    required this.productId,
  });

  final String productId;
  final String title;
  final String description;
  final double price;
  final List<String> imageList;
  final double categoryId;

  Map<String, dynamic> toJson() => _$UpdateProductRequestBodyToJson(this);
}
