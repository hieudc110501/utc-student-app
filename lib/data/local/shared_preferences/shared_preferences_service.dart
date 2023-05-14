import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _singleton =
      SharedPreferencesService._internal();
  static SharedPreferences? _preferences;

  factory SharedPreferencesService() {
    return _singleton;
  }

  SharedPreferencesService._internal();

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception("SharedPreferences have not been initialized yet.");
    }
    return _preferences!;
  }
}
