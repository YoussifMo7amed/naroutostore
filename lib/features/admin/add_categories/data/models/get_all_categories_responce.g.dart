// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponce _$GetAllCategoriesResponceFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesResponce(
      GetAllCategoriesData.fromjson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllCategoriesResponceToJson(
        GetAllCategoriesResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllCategoriesData _$GetAllCategoriesDataFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesData(
      (json['categories'] as List<dynamic>)
          .map((e) => GetAllCategoriesModel.fromjson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllCategoriesDataToJson(
        GetAllCategoriesData instance) =>
    <String, dynamic>{
      'categories': instance.categoriesList,
    };

GetAllCategoriesModel _$GetAllCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    GetAllCategoriesModel(
      json['name'] as String?,
      json['id'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$GetAllCategoriesModelToJson(
        GetAllCategoriesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
    };
