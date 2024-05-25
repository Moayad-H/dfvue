import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'en_us_translations.dart';
import 'ar_translations.dart';

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': enUs,
    'ar': arSa,
  };

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();

  String getString(String text) =>
      _localizedValues[locale.languageCode]![text] ?? text;
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return Future.value(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}

extension LocalizationExtension on String {
  String tr(BuildContext context) {
    return AppLocalization.of(context).getString(this);
  }
}
