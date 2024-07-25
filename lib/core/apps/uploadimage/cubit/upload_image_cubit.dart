import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/apps/uploadimage/repo/upload_image_repo.dart';
import 'package:naroutoshop/core/utils/image_pick.dart';
part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo) : super(const UploadImageState.initial());

  final UploadImageRepo _repo;
  String getImageUrl = '';
  List<String> imageList = ['', '', ''];
  List<String> updateimageList = [];

  Future<void> uploadImage() async {
    final pickedImage = await PickImageUtils().pickImage();

    if (pickedImage == null) return;
    emit(const UploadImageState.loading());
    final result = await _repo.uploadImage(pickedImage);
    result.when(
      success: (image) {
        getImageUrl = image.location ?? '';
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.error(error: error));
      },
    );
  }

  Future<void> uploadImageList({required int indexId}) async {
    final pickedImage = await PickImageUtils().pickImage();

    if (pickedImage == null) return;
    emit(UploadImageState.loadingList(index: indexId));
    final result = await _repo.uploadImage(pickedImage);
    result.when(
      success: (image) {
        imageList
          ..removeAt(indexId)
          ..insert(indexId, image.location ?? '');
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.error(error: error));
      },
    );
  }

  Future<void> uploadUpdateImageList({
    required int indexId,
    required List<String> productImageList,
  }) async {
    final pickedImage = await PickImageUtils().pickImage();

    if (pickedImage == null) return;
    emit(UploadImageState.loadingList(index: indexId));
    final result = await _repo.uploadImage(pickedImage);
    result.when(
      success: (image) {
        updateimageList = productImageList;
        updateimageList
          ..removeAt(indexId)
          ..insert(indexId, image.location ?? '');
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.error(error: error));
      },
    );
  }

  //remove image
  void removeImage() {
    getImageUrl = '';
    emit(UploadImageState.removeImage(imageUrl: getImageUrl));
  }
}
