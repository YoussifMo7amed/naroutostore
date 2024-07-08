import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';

class ProductDetailsSlider extends StatefulWidget {
  const ProductDetailsSlider({super.key});

  @override
  State<ProductDetailsSlider> createState() => _ProductDetailsSliderState();
}

int activeIndex = 0;

class _ProductDetailsSliderState extends State<ProductDetailsSlider> {
  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 500,
      child: Column(
        children: [
          CarouselSlider.builder(
          
            itemCount: 1,
            options: CarouselOptions(
              height: 250.h,
              reverse: true,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                activeIndex = index;
                setState(() {});
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return CachedNetworkImage(
                imageUrl: 'https://plus.unsplash.com/premium_photo-1720188548640-3c5602bb7832?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
                placeholder: (context, url) => const SizedBox.shrink(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: widget.imageList.asMap().entries.map(
          //       (e) {
          //         return Container(
          //           margin: EdgeInsets.symmetric(horizontal: 3.w),
          //           width: 15.w,
          //           height: 4.h,
          //           decoration: BoxDecoration(
          //               color: activeIndex == e.key
          //                   ? context.color.bluePinkLight
          //                   : Colors.grey,
          //               borderRadius: BorderRadius.circular(10)),
          //         );
          //       },
          //     ).toList())
        ],
      ),
    );
  }
}
