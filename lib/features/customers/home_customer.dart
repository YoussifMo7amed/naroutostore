import 'package:flutter/material.dart';

class HomeCustomer extends StatelessWidget {
  const HomeCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Customer Home'),
      ),
    );
  }
}