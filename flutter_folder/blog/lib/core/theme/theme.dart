import 'package:blog/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static   _border([Color color=AppPallet.borderColor]) =>  OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: color,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor:AppPallet.backgroundColor, 
    ),
    scaffoldBackgroundColor: AppPallet.backgroundColor,
    inputDecorationTheme:  InputDecorationTheme(
      contentPadding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallet.textFieldBorderColor),
    ),
  );
}
