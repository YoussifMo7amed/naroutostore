import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';

class CreateProductImage extends StatelessWidget {
  const CreateProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ShowToast.showToastSuccessTop(
                  message: context.translate(LangKeys.imageUploaded),
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
            return state.maybeWhen(
              loadingList: (indexId) {
                if (indexId == index) {
                  return Container(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                return SelectProductImage(
                  index: index,
                  onTap: () {},
                );
              },
              orElse: () {
                return SelectProductImage(
                  index: index,
                  onTap: () {
                    context
                        .read<UploadImageCubit>()
                        .uploadImageList(indexId: index);
                  },
                );
              },
            );
          },
        );
      },
      separatorBuilder: (context, index) => verticalSpace(6.h),
    );
  }
}

class SelectProductImage extends StatelessWidget {
  const SelectProductImage({
    required this.index,
    required this.onTap,
    super.key,
  });
  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return context.read<UploadImageCubit>().imageList[index].isEmpty
        ? InkWell(
            onTap: onTap,
            child: Container(
              height: 90.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.8),
              ),
              child: const Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          )
        : Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.8),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  context.read<UploadImageCubit>().imageList[index],
                ),
              ),
            ),
          );
  }
}
