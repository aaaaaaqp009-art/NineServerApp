import 'package:flutter/material.dart';

void main() {
  runApp(const NineApp());
}

class NineApp extends StatelessWidget {
  const NineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nine Server',
      theme: ThemeData.dark(useMaterial3: true),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  void login() {
    if (username.text == 'itsmahyar' &&
        password.text == 'its minecraft') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('نام کاربری یا رمز اشتباه است')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nine Server')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ورود به Nine Server',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: username,
              decoration: const InputDecoration(
                labelText: 'نام کاربری',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'رمز عبور',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: login,
              child: const Text('ورود'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nine Server'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            '🔥 اخبار و رویدادها',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),

          Card(
            child: ListTile(
              leading: const Icon(Icons.campaign),
              title: const Text('رویداد جدید Nine Server'),
              subtitle: const Text(
                'به‌زودی رویداد جدید سرور برگزار می‌شود!',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.public),
              title: const Text('Nine Server آنلاین است'),
              subtitle: const Text(
                'آدرس سرور: nine.9craft.vip',
              ),
            ),
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.event),
            label: const Text('رویدادها'),
          ),

          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            label: const Text('فروشگاه رنک'),
          ),

          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.info),
            label: const Text('اطلاعات سرور'),
          ),
        ],
      ),
    );
  }
}
