// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProdutRequestBody _$CreateProdutRequestBodyFromJson(
        Map<String, dynamic> json,) =>
    CreateProdutRequestBody(
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      categoryId: (json['categoryId'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateProdutRequestBodyToJson(
        CreateProdutRequestBody instance,) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'categoryId': instance.categoryId,
    };
