import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static SharedPreferences? _prefsInstance;

  // Keys for your preferences (customize as needed)
  static const String ourAuthTokenKey = 'authToken'; // Our Auth key
  static const String userAuthTokenKey = 'userToken';
  static const String usernameKey = 'username';

  // Set a value in shared preferences
  static Future<void> setAuthToken(String authTokenKey ,String authToken) async {
    final prefs = await _instance;
    prefs.setString(authTokenKey, authToken);
  }

  // Get a value from shared preferences
  static Future<String?> getAuthToken(String authTokenKey) async {
    final prefs = await _instance;
    return prefs.getString(authTokenKey);
  }

  // Clear a specific preference
  static Future<void> clearAuthToken(String authTokenKey ,) async {
    final prefs = await _instance;
    prefs.remove(authTokenKey);
  }

  // Clear all preferences
  static Future<void> clearAllPreferences() async {
    final prefs = await _instance;
    prefs.clear();
  }
}
