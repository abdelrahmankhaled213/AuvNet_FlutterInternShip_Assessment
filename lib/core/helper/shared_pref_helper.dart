import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {

  SharedPrefHelper._();

  static final SharedPrefHelper instance =SharedPrefHelper._();

  static late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  String? getDataString({required String key}) {
    return _sharedPreferences.getString(key);
  }


  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else {
      return await _sharedPreferences.setDouble(key, value);
    }
  }


  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }


  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return _sharedPreferences.containsKey(key);
  }

  Future<bool> clearData({required String key}) async {
    return _sharedPreferences.clear();
  }

}