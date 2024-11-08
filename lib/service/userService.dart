import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _keyName = 'name';
  static const String _keyEmail = 'email';

  // Save user information
  Future<void> saveUserInfo(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email);
  }

  // Load user information
  Future<Map<String, String?>> loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString(_keyName);
    String? email = prefs.getString(_keyEmail);
    return {'name': name, 'email': email};
  }

  // Clear user information
  Future<void> clearUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyName);
    await prefs.remove(_keyEmail);
  }
}
