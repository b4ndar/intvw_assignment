import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static dynamic getData({
    @required String? key,
  }) {
    return _prefs!.get(key!);
  }

  static dynamic getString({
    @required String? key,
  }) {
    return _prefs!.getString(key!);
  }

  static Future<bool> setData({
    @required String? key,
    @required dynamic value,
  }) async {
    if (value is String) return await _prefs!.setString(key!, value);
    if (value is String) return await _prefs!.setString(key!, value);
    if (value is int) return await _prefs!.setInt(key!, value);
    if (value is bool) return await _prefs!.setBool(key!, value);
    if (value is List<String>) return await _prefs!.setStringList(key!, value);

    return await _prefs!.setDouble(key!, value!);
  }

  static Future<void> setString(String key, String value) =>
      _prefs!.setString(key, value);

  /// clear all data stored in the shared preferences
  static clear() async {
    await _prefs!.clear();
  }
}
