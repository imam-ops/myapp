import 'package:flutter/material.dart';
import 'package:myapp/screens/admin/admin_konsultasi.dart';

class UserFkonsul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pendaftaran Konsulkan"),
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle phone button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Isian Form',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'NIK Pemohon',
                hintText: 'Masukan NIK Pemohon',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Pemohon',
                hintText: 'Masukan Nama Pemohon',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'No. HP Pemohon',
                hintText: 'Masukan No. HP Pemohon',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Permasalahan',
                hintText: 'Masukan Permasalahan',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Text(
              'Berkas',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15), // Padding
              ),
              child: Text('Pilih'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminKonsultasi()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 139, 32, 24),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15), // Padding
              ),
              child: Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }
}
