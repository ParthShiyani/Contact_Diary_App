import 'package:contact_diry/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static bool isDark = false;

  static ThemeData LightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColorLight,
      secondary: AppColors.secondaryColorLight,
      brightness: Brightness.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColorDark,
      secondary: AppColors.primaryColorDark,
      brightness: Brightness.dark,
    ),
  );
}
