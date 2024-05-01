import 'package:flutter/material.dart';
import 'package:naroutoshop/core/common/widgets/custom_appbar_admin.dart';
import 'package:naroutoshop/core/helper/extentions.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAdmin(
        ismain: true,
        tittle: 'Dashboard',
        backgroundColor: context.color.mainColor!,
      ),
      body: const Center(
        child: Text(
          'Dashboard',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
