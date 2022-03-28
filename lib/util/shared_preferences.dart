import 'package:shared_preferences/shared_preferences.dart';


/// Read Integer
Future<int> readIntPreference({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key) ?? 0;
}

/// Read String
Future<String> readStringPreference({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}

/// Read Boolean
Future<bool> readBoolPreference({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

/// Save Integer
Future<void> saveIntPreference({required String key, required int value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

/// Save String
Future<void> saveStringPreference({required String key, required String value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

/// Save Bool
Future<void> saveBoolPreference({required String key, required bool value}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}