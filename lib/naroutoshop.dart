import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naroutoshop/core/apps/app_cubit/app_cubit.dart';
import 'package:naroutoshop/core/apps/connectivity_controller.dart';
import 'package:naroutoshop/core/apps/envvariables.dart';
import 'package:naroutoshop/core/common/screens/no_network_screen.dart';
import 'package:naroutoshop/core/di/injection_container.dart';
import 'package:naroutoshop/core/language/app_localizations_setup.dart';
import 'package:naroutoshop/core/routes/app_router.dart';
import 'package:naroutoshop/core/routes/routers.dart';
import 'package:naroutoshop/core/service/shared_pref/pref_keys.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';
import 'package:naroutoshop/core/theme/app_theme.dart';


class NaroutoStore extends StatelessWidget {
  const NaroutoStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return BlocProvider(
            create: (context) => s1<AppCubit>()
              ..changeThemeMode(
                sheredMode: SharedPref().getBoolean(PrefKeys.themeMode),
              ),
            child: BlocBuilder<AppCubit, AppState>(
              buildWhen: (previous, current) {
                return previous != current;
              },
              builder: (context, state) {
                final cubit = context.read<AppCubit>();
                return ScreenUtilInit(
                  designSize: const Size(375, 812),
                  child: MaterialApp(
                    title: 'Narouto Shop',
                    debugShowCheckedModeBanner:
                        EnvVariable.instance.debugShowMode,
                    theme: cubit.isDark ? themelight() : themeDark(),
                    locale:  Locale(
                      cubit.currentLanguageCode,
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
                    initialRoute: Routes.login,
                  ),
                );
              },
            ),
          );
        } else {
          return MaterialApp(
            title: 'Narouto Shop',
            debugShowCheckedModeBanner: EnvVariable.instance.debugShowMode,
            theme: themeDark(),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
