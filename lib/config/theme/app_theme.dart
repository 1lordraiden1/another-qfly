import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/colors.dart';
import '../../constant/fonts_manager.dart';
import '../../constant/glopal_app.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: GlopalApp.langId == 0
        ? FontFamilyManager.fontFamilyEn
        : FontFamilyManager.fontFamilyAr,
    scaffoldBackgroundColor: white,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ), // blue
    iconTheme: IconThemeData(color: primaryColor, size: 20),
    textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 18.sp)),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: red,
      showCloseIcon: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),

    /// bodytext2
  );
}
