import 'package:freezed_annotation/freezed_annotation.dart';
part'create_category_responce.g.dart';

@JsonSerializable()
class CreateCategoryResponce {
  CreateCategoryResponce(this.data,);
 factory CreateCategoryResponce.fromjson(Map<String, dynamic> json) =>
      _$CreateCategoryResponceFromJson(json);
  CreateCategoryData? data;
   
}

@JsonSerializable()
class CreateCategoryData {
  CreateCategoryData(this.categoryModel);
factory  CreateCategoryData.fromjson(Map<String, dynamic> json) =>
      _$CreateCategoryDataFromJson(json);
  @JsonKey(name: 'category')
  CreateCategoryModel? categoryModel;
}

@JsonSerializable()
class CreateCategoryModel {
  CreateCategoryModel(this.name,this.id,this.image);
 factory CreateCategoryModel.fromjson(Map<String, dynamic> json) =>
      _$CreateCategoryModelFromJson(json);
final  String? name;
final String ?id;
final String? image;
}
