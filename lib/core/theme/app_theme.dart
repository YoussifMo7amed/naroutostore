import 'package:flutter/material.dart';
import 'package:naroutoshop/core/styles/colors/colors_dark.dart';
import 'package:naroutoshop/core/styles/colors/colors_light.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/theme/assets_extension.dart';
import 'package:naroutoshop/core/theme/color_extension.dart';

ThemeData themeDark() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsDark.mainColor,
    extensions:const<ThemeExtension<dynamic>> [ MyColors.dark, MyAssets.dark],
    useMaterial3: true,
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        color: ColorsDark.white,
        fontFamily: FontFamilyHelper.getlocalizedFontFamily(),
      ),
    ),
  );
}

ThemeData themelight() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsLight.mainColor,
    extensions:const<ThemeExtension<dynamic>> [ MyColors.light,MyAssets.light],
    useMaterial3: true,
  );
}
