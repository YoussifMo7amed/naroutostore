import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naroutoshop/core/apps/uploadimage/model/upload_image_responce.dart';
import 'package:naroutoshop/core/service/graphql/api_service.dart';

class UploadImageDataSource {
  const UploadImageDataSource(this._api);
  final ApiService _api;

  Future<UploadImageResponce> uploadImage({required XFile imageFile}) async {
    final formData = FormData();
    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(imageFile.path),
      ),
    );
    final response = await _api.uploadImage(formData);
    return response;
  }
}
