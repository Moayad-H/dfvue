import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeData _themeData;

  AppProvider(this._themeData);
  ThemeMode themeSelected = ThemeMode.light;
  ThemeData get themeData => _themeData;
  static Locale _locale = const Locale('en');
  static Locale _spokenLocale = const Locale('en');
  Locale? get spokenLocale => _spokenLocale;
  Locale? get locale => _locale;
  void changeThemeMode(String selected) {
    if (selected.contains('dark')) {
      themeSelected = ThemeMode.dark;
    } else {
      themeSelected = ThemeMode.light;
    }
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void setSpokenLocale(Locale locale) {
    _spokenLocale = locale;
    notifyListeners();
  }

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    saveThemeToPrefs(themeData);
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == ThemeData.light()) {
      setTheme(ThemeData.dark());
    } else {
      setTheme(ThemeData.light());
    }
  }

  void saveThemeToPrefs(ThemeData themeData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', themeData == ThemeData.dark());
  }

  Future<void> loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    _themeData = isDarkTheme ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
