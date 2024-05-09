// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_number_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesNumberResponce _$CategoriesNumberResponceFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberResponce(
      json['data'] == null
          ? null
          : CategoriesNumberData.fromjson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesNumberResponceToJson(
        CategoriesNumberResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesNumberData _$CategoriesNumberDataFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberData(
      (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => CategoriesNumberModel.fromjson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesNumberDataToJson(
        CategoriesNumberData instance) =>
    <String, dynamic>{
      'categories': instance.categoriesList,
    };

CategoriesNumberModel _$CategoriesNumberModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberModel(
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoriesNumberModelToJson(
        CategoriesNumberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
