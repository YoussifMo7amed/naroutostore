// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResponce _$BannerResponceFromJson(Map<String, dynamic> json) =>
    BannerResponce(
      data: BannersModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannerResponceToJson(BannerResponce instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

BannersModel _$BannersModelFromJson(Map<String, dynamic> json) => BannersModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannersModelToJson(BannersModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      title: json['title'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
    };
