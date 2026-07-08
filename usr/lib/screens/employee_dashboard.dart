import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Раннее созданный экран чек-листов

class EmployeeDashboard extends StatelessWidget {
  const EmployeeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дашборд Сотрудника'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Мои задачи'),
            leading: const Icon(Icons.assignment),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Чек-листы смены'),
            leading: const Icon(Icons.check_box),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('ТТК (Техкарты)'),
            leading: const Icon(Icons.restaurant_menu),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
