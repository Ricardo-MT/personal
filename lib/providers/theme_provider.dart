import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode mode;

  ThemeProvider() {
    int hour = TimeOfDay.now().hour;
    mode = (hour > 18 || hour < 6) ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleThemeMode() {
    mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
