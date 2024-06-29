import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_product_responce.g.dart';

@JsonSerializable()
class GetAllProductResponce {
  GetAllProductResponce({required this.data});

  factory GetAllProductResponce.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductResponceFromJson(json);
  final ProductGetAllData data;

  List<ProductGetAllModel> get productGetAllList {
    if (data.productsList.isEmpty) {
      return [];
    } else {
      return data.productsList;
    }
  }
}

@JsonSerializable()
class ProductGetAllData {
  ProductGetAllData({required this.productsList});

  factory ProductGetAllData.fromJson(Map<String, dynamic> json) =>
      _$ProductGetAllDataFromJson(json);
  @JsonKey(name: 'products')
  final List<ProductGetAllModel> productsList;
}

@JsonSerializable()
class ProductGetAllModel {
  ProductGetAllModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  factory ProductGetAllModel.fromJson(Map<String, dynamic> json) =>
      _$ProductGetAllModelFromJson(json);
  final String? id;
  final String? title;
  final double? price;
  final String? description;
  final List<String>? images;
  final CategoryProductModel? category;
}

@JsonSerializable()
class CategoryProductModel {
  CategoryProductModel({
    required this.id,
    required this.name,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);
  final String id;
  final String name;
}


















// {
//     "data": {
//         "products": [
//             {
//                 "id": "36",
//                 "title": "",
//                 "price": 54,
//                 "description": "Step into the spotlight with these eye-catching rainbow glitter high heels. Designed to dazzle, each shoe boasts a kaleidoscope of shimmering colors that catch and reflect light with every step. Perfect for special occasions or a night out, these stunners are sure to turn heads and elevate any ensemble.",
//                 "images": [
//                     "https://i.imgur.com/62gGzeF.jpeg",
//                     "https://i.imgur.com/5MoPuFM.jpeg",
//                     "https://i.imgur.com/sUVj7pK.jpeg"
//                 ],
//                 "category": {
//                     "id": "4",
//                     "name": "Shoes",
//                     "image": "https://i.imgur.com/qNOjJje.jpeg"
//                 }
//             },