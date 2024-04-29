import 'package:image_picker/image_picker.dart';
import 'package:naroutoshop/core/apps/uploadimage/datasource/upload_image_datasource.dart';
import 'package:naroutoshop/core/apps/uploadimage/model/upload_image_responce.dart';
import 'package:naroutoshop/core/service/graphql/api_result.dart';

class UploadImageRepo {
  UploadImageRepo(this._dataSource);

  final UploadImageDataSource _dataSource;

  Future<ApiResult<UploadImageResponce>> uploadImage(
    XFile imageFile,
  ) async {
    try {
      final response = await _dataSource.uploadImage(imageFile: imageFile);
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(
        'Please, Try again Failed to upload image',
      );
    }
  }
}
