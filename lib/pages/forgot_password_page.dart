import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final contactController = TextEditingController();

  void sendReset() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ส่งคำขอรีเซ็ตรหัสผ่านแล้ว')),
    );
  }

  @override
  void dispose() {
    contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      appBar: AppBar(title: const Text('ลืมรหัสผ่าน')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lock_reset, size: 72, color: Colors.orange),
                const SizedBox(height: 12),
                const Text(
                  'รีเซ็ตรหัสผ่าน',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: contactController,
                  decoration: const InputDecoration(
                    labelText: 'อีเมล / เบอร์โทรศัพท์',
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: sendReset,
                    icon: const Icon(Icons.send),
                    label: const Text('ส่งคำขอรีเซ็ตรหัสผ่าน'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}