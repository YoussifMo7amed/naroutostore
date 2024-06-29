import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/toast/show_toast.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/spacing.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/core/language/lang_keys.dart';

class UpdateProductImage extends StatelessWidget {
  const UpdateProductImage({required this.imageList, super.key});
  final List<String> imageList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: imageList.length,
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
              loadingList: (productIndex) {
                if (productIndex == index) {
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
                return SelectUpdateUploadImage(
                  index: index,
                  imageList: imageList,
                  onTap: () {},
                );
              },
              orElse: () {
                return SelectUpdateUploadImage(
                  index: index,
                  imageList: imageList,
                  onTap: () {
                    context.read<UploadImageCubit>().uploadUpdateImageList(
                          indexId: index,
                          productImageList: imageList,
                        );
                  },
                );
              },
            );
          },
        );
      },
      separatorBuilder: (context, index) => verticalSpace(15.h),
    );
  }
}

class SelectUpdateUploadImage extends StatelessWidget {
  const SelectUpdateUploadImage({
    required this.index,
    required this.imageList,
    required this.onTap,
    super.key,
  });
  final int index;
  final List<String> imageList;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.8),
              image: DecorationImage(
                image: NetworkImage(
                  imageList[index].imageProductFormate(),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
            child: const Icon(
              Icons.add_a_photo_outlined,
              size: 50,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
