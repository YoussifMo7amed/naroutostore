import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/features/customers/home/presentation/widgets/banners/banner_slider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.controller, super.key});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          controller: controller,

          slivers: const [

            //Banners
            SliverToBoxAdapter(
              child: BunnerSlider(),
            ),
          ],
        ));
  }
}
