import 'package:flutter/material.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';


class MyImages extends ThemeExtension<MyImages>{
 const MyImages({required this.image});

  final String? image;
  @override
  ThemeExtension<MyImages> copyWith(  {String? image}) {

    return MyImages(
     image: image,
    );

  }

  @override
  ThemeExtension<MyImages> lerp(covariant ThemeExtension<MyImages>? other, double t) {

    if(other is! MyImages){
      return this;
    }
    return MyImages(
      image: image,
    );
  }
static const MyImages dark = MyImages(
  image: AppImages.test2,
);

static const MyImages light = MyImages(
  image: AppImages.test1, 
);
}
