// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_admin.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/delete/delete_product.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/update/update_product_buttom_sheet.dart';

class ProductAdminList extends StatelessWidget {
  const ProductAdminList({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    required this.productId,
    required this.imageList,
    required this.description,
    required this.categoryId,
    super.key,
  });
  final String imageUrl;
  final String title;
  final String categoryName;
  final String price;
  final String productId;
  final List<String> imageList;
  final String description;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DeleteProduct(
                productId: productId,
              ),
              IconButton(
                onPressed: () {
                  CustomModalBottomSheet.showModalCategoryBottomSheet(
                    context: context,
                    widget: MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => sl<GetAllCategoriesAdminBloc>()
                            ..add(
                              const GetAllCategoriesAdminEvent
                                  .fetchAdminCategories(
                                isNotLoading: false,
                              ),
                            ),
                        ),
                        BlocProvider(
                          create: (context) => sl<UpdateProductBloc>(),
                        ),
                        BlocProvider(
                          create: (context) => sl<UploadImageCubit>(),
                        ),
                      ],
                      child: UpdateProductButtomSheet(
                        imageList: imageList,
                        title: title,
                        price: price,
                        description: description,
                        categoryId: categoryId,
                        categoryName: categoryName,
                        productId: productId,
                      ),
                    ),
                    whencompleted: () {
                      context.read<GetAllProductsBloc>().add(
                            const GetAllProductsEvent.getAllProducts(
                              isLoading: false,
                            ),
                          );
                    },
                  );
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Flexible(
            child: Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl.imageProductFormate(),
                height: 200.h,
                width: 120.w,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: title,
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: categoryName,
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: '\$$price ',
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
