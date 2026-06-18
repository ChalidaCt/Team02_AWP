import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/app_card.dart';

class HistoryPage extends StatelessWidget {
  final UserData user;

  const HistoryPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      appBar: AppBar(title: const Text('ประวัติการใช้งาน')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ประวัติ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                if (user.history.isEmpty)
                  const Text('ยังไม่มีประวัติ')
                else
                  ...user.history.map(
                    (item) => ListTile(
                      leading: const Icon(Icons.history, color: Colors.orange),
                      title: Text(item),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}