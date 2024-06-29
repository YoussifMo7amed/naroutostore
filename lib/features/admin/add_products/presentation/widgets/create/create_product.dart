import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/uploadimage/cubit/upload_image_cubit.dart';
import 'package:naroutoshop/core/common/bottomsheet/category_bottom_sheet.dart';
import 'package:naroutoshop/core/common/widgets/custom_button.dart';
import 'package:naroutoshop/core/common/widgets/text_app.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/features/admin/add_categories/presentation/bolc/get_all_categories_admin/get_all_categories_admin_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:naroutoshop/features/admin/add_products/presentation/widgets/create/create_product_buttom_sheet.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Products',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomModalBottomSheet.showModalCategoryBottomSheet(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<CreateProductBloc>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<UploadImageCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => sl<GetAllCategoriesAdminBloc>()
                      ..add(
                        const GetAllCategoriesAdminEvent.fetchAdminCategories(
                            isNotLoading: false,),
                      ),
                  ),
                ],
                child: const CreateProductButtomSheet(),
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
          text: 'Add',
          width: 90.w,
          height: 35.h,
          lastRadius: 10,
          threeRadius: 10,
          backgroundColor: ColorsDark.blueDark,
        ),
      ],
    );
  }
}
