import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';

class UpdateCategoryUploadImage extends StatelessWidget {
  const UpdateCategoryUploadImage({
    required this.image,
    super.key,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageUploaded),
              seconds: 2,
            );
          },
          error: (message) {
            ShowToast.showToastErrorTop(
              message: message,
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return state.maybeWhen(
          loading: () {
            return Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.8),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          },
          orElse: () {
            return Stack(
              children: [
                //old and new image
                Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.8),
                    image: DecorationImage(
                      image: cubit.getImageUrl.isEmpty
                          ? NetworkImage(image)
                          : NetworkImage(cubit.getImageUrl) as ImageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                if (cubit.getImageUrl.isEmpty)
                  Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().uploadImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  )
              ],
            );
          },
        );
      },
    );
  }
}
