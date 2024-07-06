import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/common/widgets/custom_container_linear_customer.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class BunnerSlider extends StatefulWidget {
  const BunnerSlider({super.key});

  @override
  State<BunnerSlider> createState() => _BunnerSliderState();
}

int activeIndex = 0;
List<String> imageList = [
  'https://images.unsplash.com/photo-1720247522780-db8ba86cbfef?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1720247522780-db8ba86cbfef?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1720247522780-db8ba86cbfef?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyN3x8fGVufDB8fHx8fA%3D%3D',
];

class _BunnerSliderState extends State<BunnerSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: imageList.length,
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
                    imageUrl: imageList[index],
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
              children: imageList.map(
                (e) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: 10.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                        color: context.color.bluePinkLight,
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              ).toList())
        ],
      ),
    );
  }
}
