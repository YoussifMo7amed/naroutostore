import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/customers/home/presentation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:naroutoshop/features/customers/home/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:naroutoshop/features/customers/home/presentation/bloc/get_banners/get_banners_bloc.dart';
import 'package:naroutoshop/features/customers/home/presentation/refactors/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final ScrollController controller = ScrollController();

class _HomeScreenState extends State<HomeScreen> {
  void scrollToTop() {
    controller.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetBannersBloc>()
            ..add(
              const GetBannersEvent.getBanner(),
            ),
        ),
        BlocProvider(
          create: (context) => sl<GetAllCategoriesBloc>()
            ..add(
              const GetAllCategoriesEvent.fetchAdminCategories(),
            ),
        ),
        BlocProvider(
          create: (context) => sl<GetAllProductsBloc>()
            ..add(
              const GetAllProductsEvent.getAllProducts(),
            ),
        ),
      ],
      child: Stack(
        children: [
          HomeBody(
            controller: controller,
          ),
          // FloatingButton
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: FloatingActionButton(
                backgroundColor: context.color.bluePinkLight,
                onPressed: scrollToTop,
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
