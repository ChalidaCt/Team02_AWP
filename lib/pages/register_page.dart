import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/mock_database.dart';
import 'dashboard_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final contactController = TextEditingController();
  final passwordController = TextEditingController();

  String? usernameError;
  bool hidePassword = true;

  void checkUsername() {
    final username = usernameController.text.trim();

    setState(() {
      if (username.isEmpty) {
        usernameError = null;
      } else if (MockDatabase.usernameExists(username)) {
        usernameError = 'ชื่อนี้มีผู้ใช้งานแล้ว';
      } else {
        usernameError = null;
      }
    });
  }

  void register() {
    final username = usernameController.text.trim();
    final contact = contactController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || contact.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบ')),
      );
      return;
    }

    if (MockDatabase.usernameExists(username)) {
      setState(() {
        usernameError = 'ชื่อนี้มีผู้ใช้งานแล้ว';
      });
      return;
    }

    final newUser = UserData(
      username: username,
      contact: contact,
      password: password,
      role: 'user',
      foodInTank: 1000,
      maxFood: 1000,
      schedules: [],
      history: [],
    );

    MockDatabase.addUser(newUser);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DashboardPage(user: newUser),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    usernameController.addListener(checkUsername);
  }

  @override
  void dispose() {
    usernameController.dispose();
    contactController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget socialButton(String text, IconData icon) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('สมัครด้วย $text')),
          );
        },
        icon: Icon(icon),
        label: Text('สมัครด้วย $text'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7EC),
      appBar: AppBar(title: const Text('สมัครสมาชิก')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Icon(Icons.person_add, size: 76, color: Colors.orange),
                const SizedBox(height: 12),
                const Text(
                  'สร้างบัญชีผู้ใช้งาน',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 22),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'ตั้งชื่อผู้ใช้งาน',
                    prefixIcon: const Icon(Icons.person),
                    border: const OutlineInputBorder(),
                    errorText: usernameError,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: contactController,
                  decoration: const InputDecoration(
                    labelText: 'เบอร์โทรศัพท์ / อีเมล',
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: 'สร้างรหัสผ่าน',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: register,
                    icon: const Icon(Icons.check),
                    label: const Text('สมัครสมาชิก'),
                  ),
                ),
                const SizedBox(height: 14),
                const Text('หรือสมัครด้วย'),
                const SizedBox(height: 8),
                socialButton('Google', Icons.g_mobiledata),
                socialButton('Facebook', Icons.facebook),
                socialButton('Apple ID', Icons.apple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}