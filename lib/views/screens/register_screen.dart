import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cadastro", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text("Cadastrar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("Já tem uma conta? Login"),
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', _userController.text);
    await prefs.setString('password', _passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cadastro realizado!')));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
