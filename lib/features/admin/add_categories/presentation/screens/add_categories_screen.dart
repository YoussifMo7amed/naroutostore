import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBarAdmin(
        ismain: true,
        tittle: 'Categories',
        backgroundColor: context.color.mainColor!,
      ),
      body:const Center(child: Text('Add Categories',
        style: TextStyle(fontSize: 20,color: Colors.white),
      ),),
    );
  }
}
