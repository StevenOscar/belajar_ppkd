import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static final String _loginKey = "login";

  static Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool(_loginKey) ?? false;
    return isLogin;
  }

  static void setLogin(bool login) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_loginKey, login);
  }

  static void deleteLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_loginKey);
  }
}
