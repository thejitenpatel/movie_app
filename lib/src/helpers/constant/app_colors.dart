import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors._();

  static const Color primaryColor = Color(0xFF01147C);
  static const Color secondryColor = Color(0xFF0000FD);
  static const Color tertiaryColor = Color(0xFF06B2FF);
  static const Color errorColor = Colors.red;
  static const Color whiteColor = Colors.white;

  /// The color value for dark grey text in the app.
  static const Color textBlackColor = Color.fromARGB(255, 43, 43, 43);
}
