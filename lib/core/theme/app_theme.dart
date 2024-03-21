import 'package:flutter/material.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/colors/colors_light.dart';
import 'package:naroutoshop/core/theme/color_extension.dart';
import 'package:naroutoshop/core/theme/image_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions:const<ThemeExtension<dynamic>> [ MyColors.dark, MyImages.dark],
    useMaterial3: true,
  );
}

ThemeData themelight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions:const<ThemeExtension<dynamic>> [ MyColors.light,MyImages.light],
    useMaterial3: true,
  );
}
