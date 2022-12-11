import 'package:flutter/material.dart';
import 'package:movie_app/src/helpers/constant/app_colors.dart';
import 'package:movie_app/src/helpers/constant/app_typography.dart';

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
    fontFamily: AppTypography.primary.fontFamily,
    textTheme: AppTypography.primary.textTheme,
    scaffoldBackgroundColor: AppColors.whiteColor,
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primaryColor,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
        color: AppColors.primaryColor,
      )),
      unselectedLabelColor: AppColors.primaryColor.withOpacity(0.5),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      // elevation: 0,
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: AppTypography.primary.heading22,
      iconTheme: const IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
