import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.imageUploaded),
                seconds: 2,
              );
            },
            removeImage: (removeImage) {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.imageRemoved),
                seconds: 2,
              );
            },
            error: (error) {
              ShowToast.showToastErrorTop(
                message: context.translate(error),
              );
            },
          );
        },
        builder: (context, state) {
          final imageUploaded =
              context.read<UploadImageCubit>().getImageUrl.isNotEmpty;
          return state.maybeWhen(
            loading: () {
              return CircleAvatar(
                radius: 38.r,
                backgroundImage: const AssetImage(AppImages.userAvatar),
                child: CircularProgressIndicator(
                  color: context.color.mainColor,
                ),
              );
            },
            orElse: () {
              return CircleAvatar(
                radius: 38.r,
                backgroundImage: imageUploaded
                    ? NetworkImage(context.read<UploadImageCubit>().getImageUrl)
                        as ImageProvider
                    : const AssetImage(AppImages.userAvatar),
                backgroundColor: Colors.grey.withOpacity(0.1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //remove image
                    Positioned(
                      right: -15,
                      top: -15,
                      child: IconButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().removeImage();
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    //take image
                    IconButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().uploadImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
