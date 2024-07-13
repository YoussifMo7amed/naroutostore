import 'package:flutter/material.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class CustomFavoriteBottom extends StatelessWidget {
  const CustomFavoriteBottom({
    required this.size,
    required this.onTap,
    required this.isFavorite,
    super.key,
  });
  final double size;
  final VoidCallback onTap;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
        color:
            isFavorite ? context.color.bluePinkLight : context.color.textColor,
        size: size,
      ),
    );
  }
}
