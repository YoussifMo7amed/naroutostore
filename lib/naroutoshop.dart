import 'package:flutter/material.dart';
import 'package:naroutoshop/core/apps/envvariables.dart';

class NaroutoStore extends StatelessWidget {
  const NaroutoStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: EnvVariable.instance.debugShowMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Scaffold(),
    );
  }
}
