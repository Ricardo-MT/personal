import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPurple = Color(0xFF8a6c94);
  static const Color whitePrimary = Color(0xFFCECECE);
  static const Color whiteAccent = Color(0xFF9A9A9A);
  static const Color defaultBackgroundColor = Color(0xFF333333);
  static const Color defaultColorStart = Color(0xFF010101);
  static const Color defaultColorEnd = Color(0xFF555555);
  static const Color startShadowLight = Color(0xFF888888);
  static const Color endShadowLight = Color(0xFFCACACA);
  static const Color startShadowDark = Color(0xFF010101);
  static const Color endShadowDark = Color(0xFF555555);
}

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData.light().copyWith(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: AppColors.whitePrimary,
      colorScheme: lightColorScheme,
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: AppColors.whitePrimary,
      brightness: Brightness.dark,
      primaryColor: AppColors.whitePrimary,
      colorScheme: darkColorScheme,
    );
  }

  static ColorScheme get lightColorScheme {
    final ThemeData base = ThemeData.light();
    return base.colorScheme.copyWith(
      primary: AppColors.defaultBackgroundColor,
      onPrimary: AppColors.whitePrimary,
      secondary: AppColors.defaultColorStart,
      onSecondary: AppColors.startShadowLight,
      tertiary: AppColors.whiteAccent,
      onTertiary: AppColors.endShadowLight,
      brightness: Brightness.light,
    );
  }

  static ColorScheme get darkColorScheme {
    final ThemeData base = ThemeData.dark();
    return base.colorScheme.copyWith(
      primary: AppColors.whitePrimary,
      onPrimary: AppColors.defaultBackgroundColor,
      secondary: AppColors.whiteAccent,
      onSecondary: AppColors.defaultColorStart,
      tertiary: AppColors.whiteAccent,
      onTertiary: AppColors.defaultColorEnd,
      brightness: Brightness.dark,
    );
  }
}
