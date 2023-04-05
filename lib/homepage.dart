import 'package:flutter/material.dart';
import 'calendar_page.dart';
import 'login_page.dart';
import 'trapezium_menu.dart';
import 'profile_menu.dart';
import 'cylinder_menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildMenuButton(String label, IconData icon, Widget page) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          },
          icon: Icon(icon),
          label: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 16),
        child: Column(
          children: [
            const Center(
              child: Text(
                'UJIAN TENGAH SEMESTER TPM TA. 2022/2023',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildMenuButton('Trapezium', Icons.change_history, TrapeziumMenu()),
            const SizedBox(height: 16),
            _buildMenuButton('Cylinder', Icons.do_not_disturb_on_total_silence, CylinderMenu()),
            const SizedBox(height: 16),
            _buildMenuButton('Profile', Icons.person, ProfileMenu()),
            const SizedBox(height: 16),
            _buildMenuButton('Calendar', Icons.access_time, CalendarMenu()),
          ],
        ),
      ),
    );
  }
}
