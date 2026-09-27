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
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// ================= LOGIN =================

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
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('نام کاربری یا رمز عبور اشتباه است'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nine Server'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.games,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'ورود به Nine Server',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
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
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: login,
                child: const Text('ورود'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HOME =================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void open(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

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
            '🔥 Nine Server',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text('به اپلیکیشن رسمی Nine Server خوش آمدید!'),
          const SizedBox(height: 20),

          _button(
            context,
            '📰 اخبار و رویدادها',
            Icons.campaign,
            const NewsPage(),
          ),

          _button(
            context,
            '🛒 فروشگاه رنک',
            Icons.shopping_cart,
            const ShopPage(),
          ),

          _button(
            context,
            '🌐 وضعیت سرور',
            Icons.public,
            const ServerPage(),
          ),

          _button(
            context,
            '👤 پروفایل',
            Icons.person,
            const ProfilePage(),
          ),

          _button(
            context,
            '⚙️ پنل Owner',
            Icons.admin_panel_settings,
            const OwnerPage(),
          ),
        ],
      ),
    );
  }

  Widget _button(
    BuildContext context,
    String title,
    IconData icon,
    Widget page,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => open(context, page),
      ),
    );
  }
}

// ================= NEWS =================

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اخبار و رویدادها'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.event),
              title: Text('رویداد جدید'),
              subtitle: Text(
                'به‌زودی یک رویداد جدید در Nine Server برگزار می‌شود.',
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.campaign),
              title: Text('خبر Nine Server'),
              subtitle: Text(
                'آدرس سرور: nine.9craft.vip',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= SHOP =================

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فروشگاه رنک'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _rank('Sponsor', '500,000 تومان'),
          _rank('Nine', '400,000 تومان'),
          _rank('Legend', '250,000 تومان'),
          _rank('UP', '150,000 تومان'),
          _rank('King', '50,000 تومان'),
        ],
      ),
    );
  }

  Widget _rank(String name, String price) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.workspace_premium),
        title: Text(name),
        subtitle: Text(price),
        trailing: FilledButton(
          onPressed: () {},
          child: const Text('خرید'),
        ),
      ),
    );
  }
}

// ================= SERVER =================

class ServerPage extends StatelessWidget {
  const ServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('وضعیت سرور'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.cloud_done,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Nine Server',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text('آدرس: nine.9craft.vip'),
            SizedBox(height: 10),
            Text('وضعیت: آنلاین'),
          ],
        ),
      ),
    );
  }
}

// ================= PROFILE =================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پروفایل'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 55,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'itsmahyar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('عضو Nine Server'),
          ],
        ),
      ),
    );
  }
}

// ================= OWNER =================

class OwnerPage extends StatelessWidget {
  const OwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پنل Owner'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'پنل مدیریت',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Card(
            child: ListTile(
              leading: const Icon(Icons.add),
              title: const Text('افزودن خبر'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('بخش افزودن خبر به‌زودی آنلاین می‌شود'),
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.event),
              title: const Text('ساخت رویداد'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('بخش ساخت رویداد به‌زودی آنلاین می‌شود'),
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.people),
              title: const Text('مدیریت کاربران'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('مدیریت کاربران به‌زودی اضافه می‌شود'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
