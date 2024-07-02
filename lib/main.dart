import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naroutoshop/core/apps/bloc_observer.dart';
import 'package:naroutoshop/core/apps/envvariables.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/service/push_notifications/firebase_cloud_messaging.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';
import 'package:naroutoshop/naroutoshop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await EnvVariable.instance.init(
    envType: EnvTypeEnum.prod,
  );
  await SharedPref().instantiatePreferences();
  await setupInjector();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyDRxAUz608tIpFx1DSJFUU8Hm6P9V3NqQM',
            appId: '1:340026377526:android:3f7804e0f1786cf5c85f97',
            messagingSenderId: '340026377526',
            projectId: 'narouto-store',
            storageBucket: 'narouto-store.appspot.com',
          ),
        )
      : await Firebase.initializeApp();
  await FirebaseCloudMessaging().init();
  // await FirebaseCloudMessaging().getAccessToken().then(
  //   (value) {
  //     FirebaseCloudMessaging().sendTopicNotification();
  //   },
  // );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const NaroutoStore());
  });
}
