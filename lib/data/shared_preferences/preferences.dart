

import 'dart:convert';

import 'package:HealthPaw/data/shared_preferences/preferences_keys.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Preferences _instance;
  static SharedPreferences _prefs;

  Preferences._();

  factory Preferences() => _getInstance();

  static Preferences _getInstance() {
    if (_instance == null) {
      _instance = Preferences._();
    }
    return _instance;
  }

  static Future<void> initPrefs() async => _prefs = await SharedPreferences.getInstance();

  static set setUser(User user)  => _prefs.setString(PreferencesKeys.USER, jsonEncode(user.toJson()));
  static User get getUser        => _prefs.getString(PreferencesKeys.USER) != null ? User.fromJson(jsonDecode(_prefs.getString(PreferencesKeys.USER))) : null;

  static Future<bool> clear() async => await _prefs.clear();
}