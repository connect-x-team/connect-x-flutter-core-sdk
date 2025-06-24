import 'package:shared_preferences/shared_preferences.dart';

class CoreServiceStorage {
  getItem({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString(key);
    return value;
  }

  setItem({required String key, required dynamic value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  removeItem({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
