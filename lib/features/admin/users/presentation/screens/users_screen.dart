import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBarAdmin(
        ismain: true,
        tittle: 'Users',
        backgroundColor: context.color.mainColor!,
      ),
      body:const Center(child: Text('Users Screen',
        style: TextStyle(fontSize: 20,color: Colors.white),
      )),
    );
  }
}
