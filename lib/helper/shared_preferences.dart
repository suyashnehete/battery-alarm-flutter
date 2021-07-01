import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
}
