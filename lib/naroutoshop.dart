import 'package:flutter/material.dart';

class NaroutoStore extends StatelessWidget {
  const NaroutoStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NaroutoStore(),
    );
  }
}
