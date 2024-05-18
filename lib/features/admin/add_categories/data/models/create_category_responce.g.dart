// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryResponce _$CreateCategoryResponceFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryResponce(
      CreateCategoryData.fromjson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryResponceToJson(
        CreateCategoryResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CreateCategoryData _$CreateCategoryDataFromJson(Map<String, dynamic> json) =>
    CreateCategoryData(
      CreateCategoryModel.fromjson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateCategoryDataToJson(CreateCategoryData instance) =>
    <String, dynamic>{
      'category': instance.categoryModel,
    };

CreateCategoryModel _$CreateCategoryModelFromJson(Map<String, dynamic> json) =>
    CreateCategoryModel(
      json['name'] as String?,
      json['id'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$CreateCategoryModelToJson(
        CreateCategoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
    };
