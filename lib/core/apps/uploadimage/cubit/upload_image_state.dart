part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = _LoadingState;
    const factory UploadImageState.loadingList({required int index}) = _LoadingListState;
  const factory UploadImageState.success() = _SuccessState;
  const factory UploadImageState.removeImage({required String imageUrl}) =
      _RemoveImageState;
  const factory UploadImageState.error({required String error}) = _ErrorState;
}
