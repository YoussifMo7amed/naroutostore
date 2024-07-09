// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponce _$ProductDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponce(
      ProductDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponceToJson(
        ProductDetailsResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductDetailsData _$ProductDetailsDataFromJson(Map<String, dynamic> json) =>
    ProductDetailsData(
      products: ProductsDetailsModel.fromJson(
          json['products'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsDataToJson(ProductDetailsData instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductsDetailsModel _$ProductsDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ProductsDetailsModel(
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductsDetailsModelToJson(
        ProductsDetailsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
    };
