// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_number_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsNumberResponce _$ProductsNumberResponceFromJson(
        Map<String, dynamic> json) =>
    ProductsNumberResponce(
      json['data'] == null
          ? null
          : ProductsNumberData.fromjson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsNumberResponceToJson(
        ProductsNumberResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductsNumberData _$ProductsNumberDataFromJson(Map<String, dynamic> json) =>
    ProductsNumberData(
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsNumberModel.fromjson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsNumberDataToJson(ProductsNumberData instance) =>
    <String, dynamic>{
      'products': instance.productsList,
    };

ProductsNumberModel _$ProductsNumberModelFromJson(Map<String, dynamic> json) =>
    ProductsNumberModel(
      json['title'] as String?,
    );

Map<String, dynamic> _$ProductsNumberModelToJson(
        ProductsNumberModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
