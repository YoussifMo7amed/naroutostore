import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_details_responce.g.dart';

@JsonSerializable()
class ProductDetailsResponce {
  ProductDetailsResponce(this.data);

  factory ProductDetailsResponce.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponceFromJson(json);

  ProductDetailsData data;

 
}

@JsonSerializable()
class ProductDetailsData {
  ProductDetailsData({required this.products});

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataFromJson(json);

  final ProductsDetailsModel products;
}

@JsonSerializable()
class ProductsDetailsModel {

  ProductsDetailsModel({required this.title, required this.price, required this.description, required this.images});

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsDetailsModelFromJson(json);

  final String title;
 final double price;
 final String description;
  final List<String> images;

}



// {
//     "data": {
//         "product": {
//             "title": "Majestic Mountain Graphic T-Shirt",
//             "price": 44,
//             "images": [
//                 "https://i.imgur.com/QkIa5tT.jpeg",
//                 "https://i.imgur.com/jb5Yu0h.jpeg",
//                 "https://i.imgur.com/UlxxXyG.jpeg"
//             ],
//             "category": {
//                 "id": "1",
//                 "name": "Clothes",
//                 "image": "https://i.imgur.com/QkIa5tT.jpeg"
//             }
//         }
//     }
// }