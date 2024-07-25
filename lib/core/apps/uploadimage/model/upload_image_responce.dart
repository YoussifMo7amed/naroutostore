import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_responce.g.dart';

@JsonSerializable()
class UploadImageResponce {
  UploadImageResponce({this.location});
  
  factory UploadImageResponce.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponceFromJson(json);

  String? location;
}
