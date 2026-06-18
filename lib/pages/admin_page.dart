import 'package:flutter/material.dart';
import '../services/mock_database.dart';
import 'login_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  void logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = MockDatabase.normalUsers();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'ข้อมูลผู้ใช้งานทั้งหมด',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...users.map(
            (user) => Card(
              child: ExpansionTile(
                leading: const Icon(Icons.person, color: Colors.orange),
                title: Text(user.username),
                subtitle: Text(user.contact),
                children: [
                  ListTile(title: Text('อาหารคงเหลือ: ${user.foodInTank} กรัม')),
                  ListTile(title: Text('จำนวนตารางเวลา: ${user.schedules.length}')),
                  ListTile(title: Text('จำนวนประวัติ: ${user.history.length}')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}