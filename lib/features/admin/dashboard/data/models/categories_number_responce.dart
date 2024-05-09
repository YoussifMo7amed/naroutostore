import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_number_responce.g.dart';

@JsonSerializable()
class CategoriesNumberResponce {
  CategoriesNumberResponce(this.data,);
 factory CategoriesNumberResponce.fromjson(Map<String, dynamic> json) =>
      _$CategoriesNumberResponceFromJson(json);
  CategoriesNumberData? data;
   String get number {
    if (data!.categoriesList!.isEmpty) {
      return '0';
    } else {
      return data!.categoriesList!.length.toString();
    }
  }
}

@JsonSerializable()
class CategoriesNumberData {
  CategoriesNumberData(this.categoriesList);
factory  CategoriesNumberData.fromjson(Map<String, dynamic> json) =>
      _$CategoriesNumberDataFromJson(json);
  @JsonKey(name: 'categories')
  List<CategoriesNumberModel>? categoriesList;
}

@JsonSerializable()
class CategoriesNumberModel {
  CategoriesNumberModel(this.name);
 factory CategoriesNumberModel.fromjson(Map<String, dynamic> json) =>
      _$CategoriesNumberModelFromJson(json);
final  String? name;
}
