import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  Future<AuthResponse> _onSignIn() async {
    return Supabase.instance.client.auth.signInWithPassword(
      email: _email,
      password: _password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Please input your email",
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (value) {
                  _email = value;
                }),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                hintText: "Please input your password",
                prefixIcon: Icon(Icons.lock),
              ),
              onChanged: (value) {
                _password = value;
              },
            ),
            ElevatedButton(
              onPressed: _onSignIn,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
