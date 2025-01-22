import 'package:flutter/material.dart';
import 'package:myapp/screens/admin/admin_berita.dart';
import 'package:myapp/screens/admin/admin_dashboard.dart';
import 'package:myapp/screens/admin/admin_konsultasi.dart';
import 'package:myapp/screens/admin/admin_permohonan.dart';
import 'package:myapp/screens/auth/login_screen.dart';
import 'package:myapp/services/auth_service.dart';

class AdminAkun extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun"),
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Replace with your image asset
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Ubah Kata Sandi'),
              onTap: () {
                // Handle change password
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud_upload),
              title: const Text('Bantuan'),
              onTap: () {
                // Handle post data
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Keluar'),
              onTap: () async {
                await _authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.list,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminPermohonan()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.chat,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminKonsultasi()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminDashboard()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.newspaper_rounded,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminBerita()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.account_box,
                color: const Color.fromARGB(255, 139, 32, 24),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminAkun()));
              },
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
