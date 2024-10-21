import 'package:bloc_practise/core/themes/app_pallet.dart';
import 'package:flutter/material.dart';

ThemeData appDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: appBgColor,
    appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: appBgColor
  )
);
ThemeData appLightTheme = ThemeData.dark().copyWith();
