import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/features/customers/home/presentation/refactors/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final controller = ScrollController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void scrollToTop() {
    controller.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
