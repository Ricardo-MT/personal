import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode mode;

  ThemeProvider() {
    mode = TimeOfDay.now().hour > 18 ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleThemeMode() {
    mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
