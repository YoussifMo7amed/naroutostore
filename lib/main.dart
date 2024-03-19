import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naroutoshop/naroutoshop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDRxAUz608tIpFx1DSJFUU8Hm6P9V3NqQM",
              appId: "1:340026377526:android:3f7804e0f1786cf5c85f97",
              messagingSenderId: "340026377526",
              projectId: "narouto-store",
              storageBucket: "narouto-store.appspot.com"))
      : await Firebase.initializeApp();
  runApp(const NaroutoStore());
}
