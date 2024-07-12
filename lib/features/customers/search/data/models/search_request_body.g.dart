// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestBody _$SearchRequestBodyFromJson(Map<String, dynamic> json) =>
    SearchRequestBody(
      searchName: json['searchName'] as String,
      price_min: json['price_min'] as int,
      price_max: json['price_max'] as int,
    );

Map<String, dynamic> _$SearchRequestBodyToJson(SearchRequestBody instance) =>
    <String, dynamic>{
      'searchName': instance.searchName,
      'price_min': instance.price_min,
      'price_max': instance.price_max,
    };
