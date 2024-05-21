import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;

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
