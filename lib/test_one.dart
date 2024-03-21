import 'package:flutter/material.dart';
import 'package:naroutoshop/core/helper/extentions.dart';
import 'package:naroutoshop/core/styles/images/app_images.dart';

class TestOne extends StatelessWidget {
  const TestOne({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center( child: Column(
        children: [
          Text('TestOne'),
          Image.asset(context.assets.image??''),
        ],
      ),),
    );
  }
}