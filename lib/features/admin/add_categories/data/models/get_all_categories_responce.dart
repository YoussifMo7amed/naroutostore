import 'package:freezed_annotation/freezed_annotation.dart';
part'get_all_categories_responce.g.dart';

@JsonSerializable()
class GetAllCategoriesResponce {
  GetAllCategoriesResponce(this.data,);
 factory GetAllCategoriesResponce.fromjson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponceFromJson(json);
  GetAllCategoriesData data;
   List<GetAllCategoriesModel> get categoriesGetAllList {
    if (data.categoriesList.isEmpty) {
      return [];
    } else {
      return  data.categoriesList;
    }
  }
  List<String> get getCategoryDropDownList  {
   final list = data.categoriesList.map((e) => e.name ?? '').toList();
    return list;

  }
}

@JsonSerializable()
class GetAllCategoriesData {
  GetAllCategoriesData(this.categoriesList);
factory  GetAllCategoriesData.fromjson(Map<String, dynamic> json) =>
      _$GetAllCategoriesDataFromJson(json);
  @JsonKey(name: 'categories')
  List<GetAllCategoriesModel>categoriesList;
}

@JsonSerializable()
class GetAllCategoriesModel {
  GetAllCategoriesModel(this.name,this.id,this.image);
 factory GetAllCategoriesModel.fromjson(Map<String, dynamic> json) =>
      _$GetAllCategoriesModelFromJson(json);
final  String? name;
final String ?id;
final String? image;
}
