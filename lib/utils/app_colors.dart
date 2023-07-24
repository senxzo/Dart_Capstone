import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff666AF6);
  static const primaryAccentColor = Color(0xff666AF6);
  static const primaryTextColor = Colors.white;
  static const secondaryTextColor = Colors.black;

  static MaterialColor primarySwatch =
      MaterialColor(primaryColor.value, <int, Color>{
    50: primaryColor.withOpacity(0.1),
    100: primaryColor.withOpacity(0.2),
    200: primaryColor.withOpacity(0.3),
    300: primaryColor.withOpacity(0.4),
    400: primaryColor.withOpacity(0.5),
    500: primaryColor.withOpacity(0.6),
    600: primaryColor.withOpacity(0.7),
    700: primaryColor.withOpacity(0.8),
    800: primaryColor.withOpacity(0.9),
    900: primaryColor.withOpacity(1.0),
  });
}
