import 'package:flutter/material.dart';
import 'package:naroutoshop/core/apps/connectivity_controller.dart';
import 'package:naroutoshop/core/apps/envvariables.dart';
import 'package:naroutoshop/core/common/screens/no_network_screen.dart';

class NaroutoStore extends StatelessWidget {
  const NaroutoStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: ConnectivityController.instance.isConnected, builder: 
    (_, value, __) {
      if (value) {
         return MaterialApp(
      title: 'Narouto Shop',
      debugShowCheckedModeBanner: EnvVariable.instance.debugShowMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      builder: (context, Widget) {
        return Scaffold(
          body: Builder(builder: (context) {
             ConnectivityController.instance.init();
             return Widget!;
          },),
        );
      },
      home: Scaffold(),
    );
      } else {
     return    MaterialApp(
      title: 'Narouto Shop',
      debugShowCheckedModeBanner: EnvVariable.instance.debugShowMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const NoNetworkScreen(),
    );
      }
    },
    );
  
  }
}
