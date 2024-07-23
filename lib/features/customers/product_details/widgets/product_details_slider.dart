import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/animations/animate_do.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';

class ProductDetailsSlider extends StatefulWidget {
  const ProductDetailsSlider({required this.imagesList, super.key});
  final List<String> imagesList;
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
            itemCount: widget.imagesList.length,
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
                imageUrl:
                     widget.imagesList[index].imageProductFormate(),
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
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imagesList.asMap().entries.map(
                (e) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: 15.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                        color: activeIndex == e.key
                            ? context.color.bluePinkLight
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),),
                  );
                },
              ).toList(),),
        ],
      ),
    );
  }
}
