import 'dart:convert';

import 'package:HealthPaw/config/paths/app_paths.dart';
import 'package:HealthPaw/utils/general/app_enums.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppConfig {
  static AppConfig _instance;
  static Map commonStringsJson = {};

  AppConfig._();

  factory AppConfig() => _getInstance();

  static AppConfig _getInstance() {
    if (_instance == null) {
      _instance = AppConfig._();
    }
    return _instance;
  }

  static Future<void> setAppLanguage({AppLanguages language = AppLanguages.Spanish}) async {
    switch (language) {
      case AppLanguages.Spanish:
        commonStringsJson = jsonDecode(await rootBundle.loadString(AppPaths.commonStringsPathSP));
        break;
      case AppLanguages.English:
        commonStringsJson = jsonDecode(await rootBundle.loadString(AppPaths.commonStringsPathEN));
        break;
    }
  }
}