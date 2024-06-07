import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  bool LanguageButton = true;
  bool colorButton = false;
  bool fontButton = false;

  void selectLanguage() {
    LanguageButton = true;
    colorButton = false;
    fontButton = false;
  }

  void selectColorButton() {
    LanguageButton = false;
    colorButton = true;
    fontButton = false;
  }

  void selectFontButton() {
    LanguageButton = false;
    colorButton = false;
    fontButton = true;
  }
}
