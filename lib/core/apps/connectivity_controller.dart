import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityController {
  ConnectivityController._();
  static final ConnectivityController instance = ConnectivityController._();
   ValueNotifier<bool> isConnected = ValueNotifier(true);
  Future<void>init() async {
  final result=  await Connectivity().checkConnectivity();
isInternetConnected(result: result);

  Connectivity().onConnectivityChanged.listen(
    (result) {
      isInternetConnected(result: result);
    },);

  }
  bool isInternetConnected({required ConnectivityResult result}) {
    if (result == ConnectivityResult.none) {
      isConnected.value=false;
      return false;
    } else if (result == ConnectivityResult.mobile||result == ConnectivityResult.wifi) {
     isConnected.value=true;
      return true;
    } else {
      return false;
    }
  }
}
