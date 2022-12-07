import 'package:flutter/material.dart';
import 'package:movie_app/src/helpers/constant/app_colors.dart';

@immutable
class AppThemes {
  const AppThemes._();

  static final mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondryColor,
      tertiary: AppColors.tertiaryColor,
      error: AppColors.errorColor,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
  );
}
