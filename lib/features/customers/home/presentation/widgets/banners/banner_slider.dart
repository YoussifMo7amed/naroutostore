import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_customer.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/helper/string_extention.dart';

class BunnerSlider extends StatefulWidget {
  const BunnerSlider({required this.imageList, super.key});
  final List<String> imageList;
  @override
  State<BunnerSlider> createState() => _BunnerSliderState();
}

int activeIndex = 0;

class _BunnerSliderState extends State<BunnerSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: widget.imageList.length,
            options: CarouselOptions(
              height: 160.h,
              reverse: true,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                activeIndex = index;
                setState(() {});
              },
            ),
            itemBuilder: (context, index, realIndex) {
              return CustomContainerLinearCustomer(
                height: 160.h,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageList[index].imageProductFormate(),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageList.asMap().entries.map(
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
