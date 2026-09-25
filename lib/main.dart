import 'package:flutter/material.dart';

void main() => runApp(const NineApp());

class NineApp extends StatelessWidget {
  const NineApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Nine Server',
    theme: ThemeData.dark(useMaterial3: true),
    home: const LoginPage(),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final n = TextEditingController(), p = TextEditingController(), r = TextEditingController();
  void login() {
    if (n.text.trim() == 'itsmahyar' && p.text == 'its minecraft' && r.text == p.text) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('اطلاعات ورود صحیح نیست')));
    }
  }
  @override Widget build(BuildContext c) => Scaffold(
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('NINE SERVER', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const Text('سلام 👋 برای ورود اطلاعات خود را وارد کنید'),
        const SizedBox(height: 24),
        TextField(controller: n, decoration: const InputDecoration(labelText: 'اسم')),
        const SizedBox(height: 12),
        TextField(controller: p, obscureText: true, decoration: const InputDecoration(labelText: 'رمز عبور')),
        const SizedBox(height: 12),
        TextField(controller: r, obscureText: true, decoration: const InputDecoration(labelText: 'تکرار رمز')),
        const SizedBox(height: 24),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: login, child: const Text('ورود'))),
      ]),
    )),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Nine Server')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const Text('👑 Owner: itsmahyar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 18),
      _tile(c, '🏆 رنک‌ها', 'انتخاب رنک و مدت', const RankPage()),
      _tile(c, '🎉 رویدادها', 'اخبار و رویدادها', const InfoPage('رویدادها')),
      _tile(c, '📢 اخبار', 'آخرین اطلاعیه‌ها', const InfoPage('اخبار')),
    ]),
  );
  Widget _tile(BuildContext c, String a, String b, Widget p) => Card(
    child: ListTile(title: Text(a), subtitle: Text(b),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.push(c, MaterialPageRoute(builder: (_) => p))),
  );
}

class RankPage extends StatefulWidget {
  const RankPage({super.key});
  @override State<RankPage> createState() => _RankPageState();
}
class _RankPageState extends State<RankPage> {
  final player = TextEditingController();
  String rank = 'Sponsor', duration = '1 ماه';
  final prices = const {
    'Sponsor': {'1 ماه': 500000, '3 ماه': 1300000, '6 ماه': 2400000},
    'Nine': {'1 ماه': 400000, '3 ماه': 1050000, '6 ماه': 1900000},
    'Legend': {'1 ماه': 250000, '3 ماه': 650000, '6 ماه': 1200000},
    'UP': {'1 ماه': 150000, '3 ماه': 390000, '6 ماه': 700000},
    'King': {'1 ماه': 50000, '3 ماه': 130000, '6 ماه': 240000},
  };
  @override Widget build(BuildContext c) {
    final amount = prices[rank]![duration]!;
    return Scaffold(appBar: AppBar(title: const Text('خرید رنک')), body: Padding(
      padding: const EdgeInsets.all(20), child: ListView(children: [
        TextField(controller: player, decoration: const InputDecoration(labelText: 'اسم بازیکن')),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(value: rank, decoration: const InputDecoration(labelText: 'رنک'),
          items: prices.keys.map((x) => DropdownMenuItem(value: x, child: Text(x))).toList(),
          onChanged: (x) => setState(() => rank = x!)),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(value: duration, decoration: const InputDecoration(labelText: 'مدت'),
          items: const ['1 ماه','3 ماه','6 ماه'].map((x) => DropdownMenuItem(value: x, child: Text(x))).toList(),
          onChanged: (x) => setState(() => duration = x!)),
        const SizedBox(height: 24),
        Text('مبلغ: $amount تومان', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: player.text.trim().isEmpty ? null : () => Navigator.push(c, MaterialPageRoute(
            builder: (_) => PaymentPage(player: player.text.trim(), rank: rank, duration: duration, amount: amount))),
          child: const Text('پرداخت')),
      ]),
    ));
  }
}

class PaymentPage extends StatelessWidget {
  final String player, rank, duration; final int amount;
  const PaymentPage({super.key, required this.player, required this.rank, required this.duration, required this.amount});
  @override Widget build(BuildContext c) => Scaffold(appBar: AppBar(title: const Text('پرداخت')), body: Padding(
    padding: const EdgeInsets.all(24), child: ListView(children: [
      const Text('💳 پرداخت کارت‌به‌کارت', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      const SizedBox(height: 20),
      const Text('شماره کارت: 6037 **** **** 9623'),
      const Text('به نام: هادی براتزاده'),
      const SizedBox(height: 12),
      Text('مبلغ: $amount تومان'),
      Text('بازیکن: $player'),
      Text('رنک: $rank'),
      Text('مدت: $duration'),
      const SizedBox(height: 24),
      const Text('بعد از انتقال وجه، از رسید عکس بگیرید و به آیدی روبیکا @dragons23 ارسال کنید.'),
    ]),
  ));
}

class InfoPage extends StatelessWidget {
  final String title;
  const InfoPage(this.title, {super.key});
  @override Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(child: Text('$title در مرحله اتصال آنلاین اضافه می‌شود.')),
  );
}
