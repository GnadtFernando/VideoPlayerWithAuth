import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static saveLocalStorage(String key, String value) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static saveIntLocalStorage(String key, int value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setInt(key, value);
  }

  static removeAllSave() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  static getLocalStorage(String key) async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(key)) {
      return preferences.get(key).toString();
    } else {
      return 'not contain';
    }
  }

  static removeLocalStorage(String key) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }

  static saveObj(String key, dynamic value) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(key, json.encode(value));
  }

  static getObj(String key) async {
    final preferences = await SharedPreferences.getInstance();
    String? getObj = preferences.getString(key);
    return json.decode(getObj!);
  }

  static saveBoolLocal(String key, bool value) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  static getBoolLocal(String key) async {
    final preferences = await SharedPreferences.getInstance();
    bool? value = preferences.getBool(key);
    return value;
  }
}
