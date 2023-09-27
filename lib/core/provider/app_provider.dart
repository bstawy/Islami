import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String currentLocal = 'en';

  ThemeMode currentTheme = ThemeMode.dark;

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) {
      return;
    }
    currentTheme = newTheme;

    notifyListeners();
  }

  changeLanguage(String newLanguage) {
    if (currentLocal == newLanguage) {
      return;
    }
    currentLocal = newLanguage;

    notifyListeners();
  }

  bool isDark() => currentTheme == ThemeMode.dark;

  String backgroundImage() {
    return isDark()
        ? 'assets/images/background_dark.png'
        : 'assets/images/background.png';
  }
}
