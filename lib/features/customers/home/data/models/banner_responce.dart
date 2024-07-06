import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/utils/app_strings.dart';

part 'banner_responce.g.dart';

@JsonSerializable()
class BannerResponce {
  BannerResponce({required this.data});

  factory BannerResponce.fromJson(Map<String, dynamic> json) =>
      _$BannerResponceFromJson(json);

  BannersModel data;

  List<String> get images {
    final list = data.products
        .where(
          (e) => e.title.contains(bannerTitle),
        )
        .toList();

    if (list.isEmpty) {
      return [];
    } else {
      return list.first.images;
    }
  }
}

@JsonSerializable()
class BannersModel {
  BannersModel({required this.products});

  factory BannersModel.fromJson(Map<String, dynamic> json) =>
      _$BannersModelFromJson(json);

  final List<ProductsModel> products;
}

@JsonSerializable()
class ProductsModel {
  ProductsModel({required this.title, required this.images});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  final String title;

  final List<String> images;
}
