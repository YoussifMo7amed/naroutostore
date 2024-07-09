import 'package:flutter/material.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class CustomShareBottom extends StatelessWidget {
  const CustomShareBottom({required this.size, super.key});
final double size ;
  @override
  Widget build(BuildContext context) {
    return  IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.share,
                  
                  color: context.color.textColor,
                  size:size ,
                ),
              );
  }
}