// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductResponce _$GetAllProductResponceFromJson(
        Map<String, dynamic> json) =>
    GetAllProductResponce(
      data: ProductGetAllData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductResponceToJson(
        GetAllProductResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductGetAllData _$ProductGetAllDataFromJson(Map<String, dynamic> json) =>
    ProductGetAllData(
      productsList: (json['products'] as List<dynamic>)
          .map((e) => ProductGetAllModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductGetAllDataToJson(ProductGetAllData instance) =>
    <String, dynamic>{
      'products': instance.productsList,
    };

ProductGetAllModel _$ProductGetAllModelFromJson(Map<String, dynamic> json) =>
    ProductGetAllModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] == null
          ? null
          : CategoryProductModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductGetAllModelToJson(ProductGetAllModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'category': instance.category,
    };

CategoryProductModel _$CategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryProductModelToJson(
        CategoryProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
