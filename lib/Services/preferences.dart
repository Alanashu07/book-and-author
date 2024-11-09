import 'package:shared_preferences/shared_preferences.dart';


//Share Preference for saving jwt
class Preferences {
  static SharedPreferences? prefs;

  static Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveJWT(String jwt) async {
    await prefs?.setString('jwt', jwt);
  }

  static String getJWT() {
    return prefs?.getString('jwt') ?? '';
  }
}