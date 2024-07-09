import 'package:flutter/material.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class CustomFavoriteBottom extends StatelessWidget {
  const CustomFavoriteBottom({required this.size, super.key});
  final double size;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.favorite_outline_outlined,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
