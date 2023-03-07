import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/consts/app_colors.dart';

class MyThemes {
  static ThemeData orangeTheme = ThemeData(
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kPrimary,
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.kPrimary,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    ),
    scaffoldBackgroundColor: AppColors.kBackGround,
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimary,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.kPrimary),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimary,
    ),
  );
  static ThemeData purpelTheme = ThemeData(
    dividerColor: AppColors.kPrimary2,
    fontFamily: 'Cairo',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kPrimary2,
      centerTitle: true,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.kPrimary2,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    ),
    scaffoldBackgroundColor: AppColors.kBackGround2,
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimary2,
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimary2,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.kPrimary2),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimary2,
    ),
  );
}

ThemeData appTheme() => ThemeData();

//ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
enum AppTheme {
  light('lightTheme'),
  dark('dark Theme');

  const AppTheme(this.name);
  final String name;
}

final appThemeData = {
  AppTheme.light: ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.green[700]),
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
  ),
  AppTheme.dark: ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  ),
};
