import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/connectivity_controller.dart';
import 'package:naroutoshop/core/apps/envvariables.dart';
import 'package:naroutoshop/core/common/screens/no_network_screen.dart';
import 'package:naroutoshop/core/language/app_localizations_setup.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/styles/fonts/font_family_helper.dart';
import 'package:naroutoshop/core/styles/fonts/font_wieght_helper.dart';
import 'package:naroutoshop/core/theme/app_theme.dart';

import 'core/routes/app_router.dart';

class NaroutoStore extends StatelessWidget {
  const NaroutoStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            child: MaterialApp(
              title: 'Narouto Shop',
              debugShowCheckedModeBanner: EnvVariable.instance.debugShowMode,
              theme: themeDark(),
              locale: const Locale(
                'en',
              ),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,

              /* supportedLocales: const [
                Locale('en', 'ar'),
              ]
              localizationsDelegates: const [
                // ... app-specific localization delegate[s] here
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],*/
              builder: (context, Widget) {
                return GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Scaffold(
                    body: Builder(
                      builder: (context) {
                        ConnectivityController.instance.init();
                        return Widget!;
                      },
                    ),
                  ),
                );
              },
              onGenerateRoute: AppRouter.generateroutes,
              initialRoute: Routes.test1,
            ),
          );
        } else {
          return MaterialApp(
            title: 'Narouto Shop',
            debugShowCheckedModeBanner: EnvVariable.instance.debugShowMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
