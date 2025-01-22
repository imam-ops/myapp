import 'package:flutter/material.dart';
import 'package:myapp/screens/auth/login_screen.dart';
import 'package:myapp/services/auth_service.dart';

class UserAkun extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Akun'),
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
            const SizedBox(height: 16),
            const Text(
              'Mahesa Putra',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'COO|Tetap',
              style: TextStyle(fontSize: 16, color: Colors.grey),
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
    );
  }
}
