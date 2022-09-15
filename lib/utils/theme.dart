import 'package:flutter/material.dart';

class AppColors {
  static Color whitePrimary = const Color(0xFFCECECE);
  static Color whiteAccent = const Color(0xFF9A9A9A);
}

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: AppColors.whitePrimary,
      colorScheme: lightColorScheme,
    );
  }

  static ThemeData get dark {
    return ThemeData(
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
      // primary: AppColors.AMARILLO,
      // onPrimary: AppColors.NEGRO,
      // secondary: AppColors.GRIS1,
      // onSecondary: AppColors.NEGRO,
      // error: AppColors.ERROR,
      // tertiary: AppColors.GRIS2,
      brightness: Brightness.light,
    );
  }

  static ColorScheme get darkColorScheme {
    final ThemeData base = ThemeData.dark();
    return base.colorScheme.copyWith(
      // primary: AppColors.NEGRO,
      // onPrimary: AppColors.AMARILLO,
      // secondary: AppColors.NEGRO,
      // onSecondary: AppColors.GRIS1,
      // error: AppColors.ERROR,
      // tertiary: AppColors.GRIS2,
      brightness: Brightness.dark,
    );
  }
}
