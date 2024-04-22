import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naroutoshop/core/service/shared_pref/pref_keys.dart';
import 'package:naroutoshop/core/service/shared_pref/shared_pref.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;
  String currentLanguageCode = 'en';
//change theme mode
  Future<void> changeThemeMode({bool? sheredMode}) async {
    if (sheredMode != null) {
      isDark = sheredMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(PrefKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }

  //change language
  void SaveLanguage({required Locale local}) {
    final result = SharedPref().containPreference(PrefKeys.language)
        ? SharedPref().getString(PrefKeys.language)
        : 'en';
    currentLanguageCode = result!;
    emit(AppState.languageChange(local: local));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.language, langCode);
    currentLanguageCode = langCode;
    emit(AppState.languageChange(local: Locale(currentLanguageCode)));
  }

  void toArabic()=>_changeLang('ar');
  
  void toEnglish()=>_changeLang('en');
}
