import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_number_responce.g.dart';

@JsonSerializable()
class UsersNumberResponce {
  UsersNumberResponce(this.data);
 factory UsersNumberResponce.fromjson(Map<String, dynamic> json) =>
      _$UsersNumberResponceFromJson(json);
  UsersNumberData? data;
  String get number {
    if (data!.usersList!.isEmpty) {
      return '0';
    } else {
      return data!.usersList!.length.toString();
    }
  }
}

@JsonSerializable()
class UsersNumberData {
  UsersNumberData(this.usersList);
factory  UsersNumberData.fromjson(Map<String, dynamic> json) =>
      _$UsersNumberDataFromJson(json);
  @JsonKey(name: 'users')
  List<UsersNumberModel>? usersList;
}

@JsonSerializable()
class UsersNumberModel {
  UsersNumberModel(this.name);
 factory UsersNumberModel.fromjson(Map<String, dynamic> json) =>
      _$UsersNumberModelFromJson(json);
final  String? name;
}
