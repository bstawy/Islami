import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  late final SharedPreferences prefs;
  late String currentLocal ;
  late ThemeMode currentTheme;

  AppProvider(){
    prefs = getInstance() as SharedPreferences;
    currentLocal = prefs.getString('currentLocal') ?? 'ar';
    currentTheme = isDark() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isDark() => prefs.getBool('isDark') ?? false;

  Future<SharedPreferences> getInstance() async {
    final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    return await prefs;
  }

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) {
      return;
    }
    currentTheme = newTheme;
    prefs.setBool('isDark', currentTheme == ThemeMode.light ? false : true);

    notifyListeners();
  }

  changeLanguage(String newLanguage) {
    if (currentLocal == newLanguage) {
      return;
    }
    currentLocal = newLanguage;
    prefs.setString('currentLocal', currentLocal);

    notifyListeners();
  }

  String backgroundImage() {
    return isDark()
        ? 'assets/images/background_dark.png'
        : 'assets/images/background.png';
  }
}
