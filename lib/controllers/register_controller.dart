import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  static Future<bool> registerUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', username);
    await prefs.setString('password', password);
    return true; // Retorna true se o registro for bem-sucedido
  }
}
