import 'package:flutter/material.dart';
import '../models/user_role.dart';
import 'employee_dashboard.dart';
import 'manager_dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _login(BuildContext context, UserRole role) {
    if (role == UserRole.manager) {
      Navigator.pushReplacementNamed(context, '/manager');
    } else {
      Navigator.pushReplacementNamed(context, '/employee');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход в систему')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _login(context, UserRole.employee),
              child: const Text('Войти как Сотрудник'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context, UserRole.manager),
              child: const Text('Войти как Руководитель'),
            ),
          ],
        ),
      ),
    );
  }
}
