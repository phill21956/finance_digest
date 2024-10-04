import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences _sharedPreferences;

class PrefUtils {
  /// initialize sharedpreferences
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  ///will clear all the data stored in preference
  static clearPreferencesData() async {
    _sharedPreferences.clear();
  }

  /// will remove a [key] data stored in preference
  static remove(String key) async {
    _sharedPreferences.remove(key);
  }

  /// get stored string by [key]
  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  /// store string by [key] and [value]
  static Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  /// get stored bool by [key]
  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  /// store bool by [key] and [value]
  static Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  /// constains key [key]
  static bool find(String key) {
    return _sharedPreferences.containsKey(key);
  }

  /// set Products
  static Future<bool> setProducts(String value) async {
    return await _sharedPreferences.setString('Products', value);
  }

  /// get Products
  static String? getProducts() {
    return _sharedPreferences.getString('Products');
  }
}
