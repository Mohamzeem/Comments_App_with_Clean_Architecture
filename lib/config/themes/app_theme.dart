import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/consts/app_colors.dart';

ThemeData appTheme() => ThemeData(
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
